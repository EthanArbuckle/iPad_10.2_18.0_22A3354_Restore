@implementation _EARProfiler

- (_EARProfiler)init
{
  _EARProfiler *v2;
  _EARProfiler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_EARProfiler;
  v2 = -[_EARProfiler init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_EARProfiler reset](v2, "reset");
  return v3;
}

+ (id)sharedProfiler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30___EARProfiler_sharedProfiler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[_EARProfiler sharedProfiler]::onceToken != -1)
    dispatch_once(&+[_EARProfiler sharedProfiler]::onceToken, block);
  return (id)+[_EARProfiler sharedProfiler]::sharedProfiler;
}

- (void)reset
{
  float *begin;
  void **v4;
  NSString *power_profiler_name;
  NSString *v6;
  NSString *background_power_logfile_name;
  NSString *v8;
  NSString *runtime_power_logfile_name;
  __int128 v10;
  float *v11;

  -[_EARProfiler set_memoryProfiler:](self, "set_memoryProfiler:", 0);
  -[_EARProfiler set_perfProfiler:](self, "set_perfProfiler:", 0);
  -[_EARProfiler set_powerProfiler:](self, "set_powerProfiler:", 0);
  -[_EARProfiler set_hasPMP:](self, "set_hasPMP:", 1);
  -[_EARProfiler set_keepLogFiles:](self, "set_keepLogFiles:", 0);
  *(_OWORD *)&self->_jetsam_max = 0u;
  *(_OWORD *)&self->_n_samples = 0u;
  std::vector<float>::vector(&v10, 4uLL);
  begin = self->_background_power.__begin_;
  if (begin)
  {
    self->_background_power.__end_ = begin;
    operator delete(begin);
  }
  *(_OWORD *)&self->_background_power.__begin_ = v10;
  self->_background_power.__end_cap_.__value_ = v11;
  v4 = self->_networks.__begin_;
  if (v4)
  {
    self->_networks.__end_ = v4;
    operator delete(v4);
  }
  self->_networks.__begin_ = 0;
  self->_networks.__end_ = 0;
  self->_networks.__end_cap_.__value_ = 0;
  self->_start_time = 0.0;
  self->_end_time = 0.0;
  power_profiler_name = self->_power_profiler_name;
  self->_ane_time = 0.0;
  self->_power_profiler_name = (NSString *)&stru_1E5D49530;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("./background_power_%ld.log"), getpid());
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  background_power_logfile_name = self->_background_power_logfile_name;
  self->_background_power_logfile_name = v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("./runtime_power_%ld.log"), getpid());
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  runtime_power_logfile_name = self->_runtime_power_logfile_name;
  self->_runtime_power_logfile_name = v8;

}

- (void)setPerfProfiler:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  double v6;
  rusage v7;

  v3 = a3;
  if (-[_EARProfiler _perfProfiler](self, "_perfProfiler") != a3)
  {
    -[_EARProfiler set_perfProfiler:](self, "set_perfProfiler:", v3);
    v5 = -[_EARProfiler _perfProfiler](self, "_perfProfiler");
    v6 = 0.0;
    if (v5)
    {
      getrusage(0, &v7);
      v6 = (double)v7.ru_utime.tv_sec + (double)v7.ru_utime.tv_usec * 0.000001;
    }
    self->_start_time = v6;
  }
}

- (void)setPowerProfiler:(BOOL)a3 powerProfilerName:(id)a4
{
  _BOOL8 v5;
  FILE **v7;
  uint64_t i;
  id v9;
  void **v10;
  double v11;
  float v12;
  id v13;
  void **v14;
  float v15;
  id v16;
  void **v17;
  void **v18;
  void **v19;
  id v20;
  void *__p[2];
  char v22;
  pid_t v23;
  posix_spawn_file_actions_t v24;
  const char *v25;
  char *v26;
  const char *v27;
  void **v28;
  uint64_t v29;
  double v30;
  uint64_t v31;

  v5 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v20 = a4;
  if (-[_EARProfiler _powerProfiler](self, "_powerProfiler") != v5)
  {
    -[_EARProfiler set_powerProfiler:](self, "set_powerProfiler:", v5);
    objc_storeStrong((id *)&self->_power_profiler_name, a4);
    if (-[_EARProfiler _powerProfiler](self, "_powerProfiler"))
    {
      v7 = (FILE **)MEMORY[0x1E0C80C10];
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "Sampling background power consumption for %d seconds ", 4);
      for (i = 0; i != 4; ++i)
      {
        if (-[_EARProfiler _hasPMP](self, "_hasPMP"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ -fi 1 -G PMP > %@"), self->_power_profiler_name, self->_background_power_logfile_name);
          v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v9, "UTF8String"));
          v24 = 0;
          posix_spawn_file_actions_init(&v24);
          posix_spawn_file_actions_addopen(&v24, 1, "/dev/null", 0, 0);
          posix_spawn_file_actions_addopen(&v24, 2, "/dev/null", 0, 0);
          v23 = 0;
          v25 = "/usr/bin/sudo";
          v26 = "/bin/bash";
          if (v22 >= 0)
            v10 = __p;
          else
            v10 = (void **)__p[0];
          v27 = "-c";
          v28 = v10;
          v29 = 0;
          posix_spawn(&v23, "/bin/bash", &v24, 0, &v26, 0);
          posix_spawn_file_actions_destroy(&v24);
          if (v22 < 0)
            operator delete(__p[0]);

          usleep(0x16E360u);
          -[_EARProfiler parsePowerSummary:writeTo:](self, "parsePowerSummary:writeTo:", self->_background_power_logfile_name, &v25);
          v11 = v30;
          if (v30 == 0.0)
          {
            -[_EARProfiler set_hasPMP:](self, "set_hasPMP:", 0, v30);
            fwrite("(turning off PMP because it's unavailable, power measurements might be less accurate) ", 0x56uLL, 1uLL, *v7);
            v11 = v30;
          }
          v12 = v11;
          self->_background_power.__begin_[i] = v12;
        }
        if (!-[_EARProfiler _hasPMP](self, "_hasPMP"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ -fi 1 > %@"), self->_power_profiler_name, self->_background_power_logfile_name);
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v13, "UTF8String"));
          v24 = 0;
          posix_spawn_file_actions_init(&v24);
          posix_spawn_file_actions_addopen(&v24, 1, "/dev/null", 0, 0);
          posix_spawn_file_actions_addopen(&v24, 2, "/dev/null", 0, 0);
          v23 = 0;
          v25 = "/usr/bin/sudo";
          v26 = "/bin/bash";
          if (v22 >= 0)
            v14 = __p;
          else
            v14 = (void **)__p[0];
          v27 = "-c";
          v28 = v14;
          v29 = 0;
          posix_spawn(&v23, "/bin/bash", &v24, 0, &v26, 0);
          posix_spawn_file_actions_destroy(&v24);
          if (v22 < 0)
            operator delete(__p[0]);

          usleep(0x16E360u);
          -[_EARProfiler parsePowerSummary:writeTo:](self, "parsePowerSummary:writeTo:", self->_background_power_logfile_name, &v25);
          v15 = v30;
          self->_background_power.__begin_[i] = v15;
        }
        fputc(46, *v7);
      }
      fputc(10, *v7);
      if (-[_EARProfiler _hasPMP](self, "_hasPMP"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ -ft -G PMP > %@"), self->_power_profiler_name, self->_runtime_power_logfile_name);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v16, "UTF8String"));
        v24 = 0;
        posix_spawn_file_actions_init(&v24);
        posix_spawn_file_actions_addopen(&v24, 1, "/dev/null", 0, 0);
        posix_spawn_file_actions_addopen(&v24, 2, "/dev/null", 0, 0);
        v23 = 0;
        v25 = "/usr/bin/sudo";
        v26 = "/bin/bash";
        v17 = __p;
        if (v22 < 0)
          v17 = (void **)__p[0];
        v27 = "-c";
        v28 = v17;
        v29 = 0;
        posix_spawn(&v23, "/bin/bash", &v24, 0, &v26, 0);
        posix_spawn_file_actions_destroy(&v24);
        if (v22 < 0)
          operator delete(__p[0]);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ -ft > %@"), self->_power_profiler_name, self->_runtime_power_logfile_name);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v16, "UTF8String"));
        v24 = 0;
        posix_spawn_file_actions_init(&v24);
        posix_spawn_file_actions_addopen(&v24, 1, "/dev/null", 0, 0);
        posix_spawn_file_actions_addopen(&v24, 2, "/dev/null", 0, 0);
        v23 = 0;
        v25 = "/usr/bin/sudo";
        v26 = "/bin/bash";
        v19 = __p;
        if (v22 < 0)
          v19 = (void **)__p[0];
        v27 = "-c";
        v28 = v19;
        v29 = 0;
        posix_spawn(&v23, "/bin/bash", &v24, 0, &v26, 0);
        posix_spawn_file_actions_destroy(&v24);
        if (v22 < 0)
          operator delete(__p[0]);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("killall %@"), self->_power_profiler_name);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v16, "UTF8String"));
      v24 = 0;
      posix_spawn_file_actions_init(&v24);
      posix_spawn_file_actions_addopen(&v24, 1, "/dev/null", 0, 0);
      posix_spawn_file_actions_addopen(&v24, 2, "/dev/null", 0, 0);
      v23 = 0;
      v25 = "/usr/bin/sudo";
      v26 = "/bin/bash";
      v18 = __p;
      if (v22 < 0)
        v18 = (void **)__p[0];
      v27 = "-c";
      v28 = v18;
      v29 = 0;
      posix_spawn(&v23, "/bin/bash", &v24, 0, &v26, 0);
      posix_spawn_file_actions_destroy(&v24);
      if (v22 < 0)
        operator delete(__p[0]);
    }

  }
}

- (void)addProfilingNetwork:(void *)a3
{
  __compressed_pair<void **, std::allocator<void *>> *p_end_cap;
  void **v6;
  void **value;
  void **v8;
  void **v9;
  void ***p_value;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  void **v17;
  void **v18;
  void **end;
  void **begin;
  void *v21;

  value = self->_networks.__end_cap_.__value_;
  p_end_cap = &self->_networks.__end_cap_;
  v6 = value;
  v8 = p_end_cap[-1].__value_;
  if (v8 >= value)
  {
    p_value = &p_end_cap[-2].__value_;
    v11 = p_end_cap[-2].__value_;
    v12 = v8 - v11;
    if ((unint64_t)(v12 + 1) >> 61)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v13 = (char *)v6 - (char *)v11;
    v14 = v13 >> 2;
    if (v13 >> 2 <= (unint64_t)(v12 + 1))
      v14 = v12 + 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v14;
    if (v15)
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<kaldi::CuWorkspace *>>((uint64_t)p_end_cap, v15);
    else
      v16 = 0;
    v17 = (void **)&v16[8 * v12];
    v18 = (void **)&v16[8 * v15];
    *v17 = a3;
    v9 = v17 + 1;
    begin = self->_networks.__begin_;
    end = self->_networks.__end_;
    if (end != begin)
    {
      do
      {
        v21 = *--end;
        *--v17 = v21;
      }
      while (end != begin);
      end = *p_value;
    }
    self->_networks.__begin_ = v17;
    self->_networks.__end_ = v9;
    self->_networks.__end_cap_.__value_ = v18;
    if (end)
      operator delete(end);
  }
  else
  {
    *v8 = a3;
    v9 = v8 + 1;
  }
  self->_networks.__end_ = v9;
}

- (void)sample
{
  double max_rss;
  char *v4;
  char *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double jetsam_max;
  double v13;
  unsigned __int16 ru_ixrss;
  rusage v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  ++self->_n_samples;
  if (-[_EARProfiler _memoryProfiler](self, "_memoryProfiler"))
  {
    getrusage(0, &v15);
    max_rss = (double)v15.ru_maxrss * 0.0009765625 * 0.0009765625;
    if (max_rss < self->_max_rss)
      max_rss = self->_max_rss;
    self->_max_rss = max_rss;
    getpid();
    if ((ledger() & 0x80000000) != 0)
    {
      fwrite("Warning: Could not get ledger info for pid\n", 0x2BuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      v7 = 0;
    }
    else
    {
      ru_ixrss = v15.ru_ixrss;
      v4 = (char *)malloc_type_malloc(96 * SLOWORD(v15.ru_ixrss), 0x1000040565EDBD2uLL);
      if (!v4)
        exit(-1);
      v5 = v4;
      if ((ledger() & 0x80000000) != 0 || (__int16)ru_ixrss < 1)
      {
        v7 = -1;
      }
      else
      {
        v6 = 0;
        v7 = -1;
        v8 = v5;
        do
        {
          if (!strcmp(v8, "phys_footprint"))
            v7 = v6;
          ++v6;
          v8 += 96;
        }
        while (ru_ixrss != v6);
      }
      free(v5);
    }
    getpid();
    if ((ledger() & 0x80000000) != 0)
    {
      fwrite("Warning: Could not get ledger info for pid.\n", 0x2CuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      v11 = 0.0;
    }
    else
    {
      v9 = v15.ru_ixrss;
      v10 = malloc_type_malloc(56 * v15.ru_ixrss, 0x137D46BFuLL);
      if ((ledger() & 0x80000000) != 0 || v9 <= v7)
      {
        fwrite("Warning: Could not get ledger entry info for pid\n", 0x31uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
        free(v10);
      }
      if (v7 == -1)
        v11 = 0.0;
      else
        v11 = (double)*((uint64_t *)v10 + 7 * v7) * 0.000000953674316;
      free(v10);
    }
    jetsam_max = self->_jetsam_max;
    if (jetsam_max < v11)
      jetsam_max = v11;
    v13 = v11 + self->_jetsam_tot;
    self->_jetsam_max = jetsam_max;
    self->_jetsam_tot = v13;
  }
}

- (void)finishProfilingNetworks
{
  void **begin;
  void **end;
  void *v5;
  void *v6;

  if (-[_EARProfiler _perfProfiler](self, "_perfProfiler"))
  {
    begin = self->_networks.__begin_;
    end = self->_networks.__end_;
    if (begin != end)
    {
      do
      {
        espresso_plan_finish_profiling();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ane_performance_info");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        self->_ane_time = (double)(unint64_t)objc_msgSend(v6, "total_ane_time_ns") / 1000000000.0
                        + self->_ane_time;

        ++begin;
      }
      while (begin != end);
      begin = self->_networks.__begin_;
    }
    self->_networks.__end_ = begin;
  }
}

- (void)finishProfiling
{
  pid_t v3;
  int v4;
  double *p_jetsam_max;
  double v6;
  id v7;
  void **v8;
  void *__p[2];
  char v10;
  pid_t v11;
  posix_spawn_file_actions_t v12;
  rusage buffer;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[_EARProfiler sample](self, "sample");
  if (-[_EARProfiler _memoryProfiler](self, "_memoryProfiler"))
  {
    v3 = getpid();
    v4 = proc_pid_rusage(v3, 6, (rusage_info_t *)&buffer);
    p_jetsam_max = &self->_jetsam_max;
    v6 = (double)v14 * 0.0009765625 * 0.0009765625;
    if (v4)
      v6 = 0.0;
    if (*p_jetsam_max >= v6)
      v6 = *p_jetsam_max;
    *p_jetsam_max = v6;
  }
  if (-[_EARProfiler _perfProfiler](self, "_perfProfiler"))
  {
    getrusage(0, &buffer);
    self->_end_time = (double)buffer.ru_utime.tv_sec + (double)buffer.ru_utime.tv_usec * 0.000001;
    -[_EARProfiler finishProfilingNetworks](self, "finishProfilingNetworks");
  }
  if (-[_EARProfiler _powerProfiler](self, "_powerProfiler"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("killall %@"), self->_power_profiler_name);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));
    v12 = 0;
    posix_spawn_file_actions_init(&v12);
    posix_spawn_file_actions_addopen(&v12, 1, "/dev/null", 0, 0);
    posix_spawn_file_actions_addopen(&v12, 2, "/dev/null", 0, 0);
    v11 = 0;
    buffer.ru_utime.tv_sec = (__darwin_time_t)"/usr/bin/sudo";
    *(_QWORD *)&buffer.ru_utime.tv_usec = "/bin/bash";
    v8 = __p;
    if (v10 < 0)
      v8 = (void **)__p[0];
    buffer.ru_stime.tv_sec = (__darwin_time_t)"-c";
    *(_QWORD *)&buffer.ru_stime.tv_usec = v8;
    buffer.ru_maxrss = 0;
    posix_spawn(&v11, "/bin/bash", &v12, 0, (char *const *)&buffer.ru_utime.tv_usec, 0);
    posix_spawn_file_actions_destroy(&v12);
    if (v10 < 0)
      operator delete(__p[0]);

    usleep(0xF4240u);
    -[_EARProfiler parsePowerSummary:writeTo:](self, "parsePowerSummary:writeTo:", self->_runtime_power_logfile_name, &self->_power_summary);
  }
}

- (id)reportProfilingAsDictionary
{
  unint64_t n_samples;
  double jetsam_tot;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  float *begin;
  float *end;
  double v16;
  float *v17;
  float v18;
  uint64_t v19;
  double v20;
  double v21;
  float v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[10];
  _QWORD v45[10];
  _QWORD v46[8];
  _QWORD v47[8];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[4];
  _QWORD v51[6];

  v51[4] = *MEMORY[0x1E0C80C00];
  v43 = (id)objc_opt_new();
  if (-[_EARProfiler _memoryProfiler](self, "_memoryProfiler"))
  {
    n_samples = self->_n_samples;
    v50[0] = CFSTR("jetsam max");
    jetsam_tot = self->_jetsam_tot;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_jetsam_max);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = jetsam_tot / (double)n_samples;
    *(float *)&v6 = v6;
    v51[0] = v5;
    v50[1] = CFSTR("jetsam average");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v7;
    v50[2] = CFSTR("max rss");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_max_rss);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = CFSTR("units");
    v51[2] = v8;
    v51[3] = CFSTR("MB");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "setObject:forKeyedSubscript:", v9, CFSTR("memory"));
  }
  if (-[_EARProfiler _perfProfiler](self, "_perfProfiler"))
  {
    v10 = self->_end_time - self->_start_time;
    v48[0] = CFSTR("CPU time");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v11;
    v48[1] = CFSTR("ANE time");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ane_time);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = CFSTR("units");
    v49[1] = v12;
    v49[2] = CFSTR("s");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "setObject:forKeyedSubscript:", v13, CFSTR("perf"));
  }
  if (-[_EARProfiler _powerProfiler](self, "_powerProfiler"))
  {
    begin = self->_background_power.__begin_;
    end = self->_background_power.__end_;
    if (begin == end)
    {
      v20 = NAN;
      v23 = NAN;
    }
    else
    {
      v16 = 0.0;
      v17 = self->_background_power.__begin_;
      do
      {
        v18 = *v17++;
        v16 = v16 + v18;
      }
      while (v17 != end);
      v19 = end - begin;
      v20 = v16 / (double)(unint64_t)v19;
      v21 = 0.0;
      do
      {
        v22 = *begin++;
        v21 = v21 + (float)(v22 * v22);
      }
      while (begin != end);
      v23 = v21 / (double)(unint64_t)v19;
    }
    v46[0] = CFSTR("total energy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.total_energy);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v24;
    v46[1] = CFSTR("ANE energy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.ane_energy);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v25;
    v46[2] = CFSTR("GPU energy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.gpu_energy);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v26;
    v46[3] = CFSTR("DRAM energy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.dram_energy);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v27;
    v46[4] = CFSTR("ECPU energy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.ecpu_energy);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v28;
    v46[5] = CFSTR("PCPU energy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.pcpu_energy);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v47[5] = v29;
    v46[6] = CFSTR("other energy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.other_energy);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[7] = CFSTR("units");
    v47[6] = v30;
    v47[7] = CFSTR("J");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, CFSTR("energy"));
    v44[0] = CFSTR("mean background power");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
    v45[0] = objc_claimAutoreleasedReturnValue();
    v44[1] = CFSTR("std background power");
    v41 = (void *)v45[0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqrt(v23 - v20 * v20));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v31;
    v44[2] = CFSTR("total power");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.total_power);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v32;
    v44[3] = CFSTR("ANE power");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.ane_power);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v33;
    v44[4] = CFSTR("GPU power");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.gpu_power);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v45[4] = v34;
    v44[5] = CFSTR("DRAM power");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.dram_power);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45[5] = v35;
    v44[6] = CFSTR("ECPU power");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.ecpu_power);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v45[6] = v36;
    v44[7] = CFSTR("PCPU power");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.pcpu_power);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v45[7] = v37;
    v44[8] = CFSTR("other power");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_power_summary.other_power);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v44[9] = CFSTR("units");
    v45[8] = v38;
    v45[9] = CFSTR("mW");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 10);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "setObject:forKeyedSubscript:", v39, CFSTR("power"));
  }
  return v43;
}

- (void)reportProfiling
{
  BOOL v3;
  FILE **v4;
  float v5;
  float *begin;
  float *end;
  double v8;
  float *v9;
  float v10;
  uint64_t v11;
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  FILE *v17;
  const char *v18;
  double gpu_energy;
  double dram_energy;
  const char *v21;
  double other_energy;
  int total_power;
  int ane_power;
  int gpu_power;
  int dram_power;
  const char *v27;
  __int128 v28;
  double v29[4];

  v3 = -[_EARProfiler _memoryProfiler](self, "_memoryProfiler");
  v4 = (FILE **)MEMORY[0x1E0C80C10];
  if (v3
    || -[_EARProfiler _perfProfiler](self, "_perfProfiler")
    || -[_EARProfiler _powerProfiler](self, "_powerProfiler"))
  {
    fwrite("================ Profiler Summary ===============\n", 0x32uLL, 1uLL, *v4);
  }
  if (-[_EARProfiler _memoryProfiler](self, "_memoryProfiler"))
  {
    v5 = self->_jetsam_tot / (double)self->_n_samples;
    fprintf(*v4, "|             |  Jetsam  |    Peak   |  Average |\n|             |          |  %7.2f  | %7.2f  |\n| Memory (MB) -----------------------------------\n|             |  MAX_RSS |    Peak   |     -    |\n|             |          |  %7.2f  |          |\n=================================================\n", self->_jetsam_max, v5, self->_max_rss);
  }
  if (-[_EARProfiler _perfProfiler](self, "_perfProfiler"))
    fprintf(*v4, "| Time (s)    |    CPU   |    GPU    |    ANE*  |\n|             | %7.2f  |      -    | %7.2f  |\n=================================================\n| * ANE time unavailable for CoreML networks.   |\n=================================================\n", self->_end_time - self->_start_time, self->_ane_time);
  if (-[_EARProfiler _powerProfiler](self, "_powerProfiler"))
  {
    begin = self->_background_power.__begin_;
    end = self->_background_power.__end_;
    if (begin == end)
    {
      v12 = NAN;
      v15 = NAN;
    }
    else
    {
      v8 = 0.0;
      v9 = self->_background_power.__begin_;
      do
      {
        v10 = *v9++;
        v8 = v8 + v10;
      }
      while (v9 != end);
      v11 = end - begin;
      v12 = v8 / (double)(unint64_t)v11;
      v13 = 0.0;
      do
      {
        v14 = *begin++;
        v13 = v13 + (float)(v14 * v14);
      }
      while (begin != end);
      v15 = v13 / (double)(unint64_t)v11;
    }
    v16 = sqrt(v15 - v12 * v12);
    v17 = *v4;
    if (-[_EARProfiler _hasPMP](self, "_hasPMP"))
      v18 = "via PMP";
    else
      v18 = "non-PMP";
    *(_OWORD *)v29 = *(_OWORD *)&self->_power_summary.total_energy;
    gpu_energy = self->_power_summary.gpu_energy;
    dram_energy = self->_power_summary.dram_energy;
    if (-[_EARProfiler _hasPMP](self, "_hasPMP"))
      v21 = "via PMP";
    else
      v21 = "non-PMP";
    other_energy = self->_power_summary.other_energy;
    total_power = (int)self->_power_summary.total_power;
    ane_power = (int)self->_power_summary.ane_power;
    v28 = *(_OWORD *)&self->_power_summary.ecpu_energy;
    gpu_power = (int)self->_power_summary.gpu_power;
    dram_power = (int)self->_power_summary.dram_power;
    if (-[_EARProfiler _hasPMP](self, "_hasPMP"))
      v27 = "via PMP";
    else
      v27 = "non-PMP";
    fprintf(v17, "| Background  |   Idle   |  Average  |   std    |\n| Power* (mW) |          |   %5.1f   |  %5.1f   |\n| %s     |          |           |          |\n|------------------------------------------------\n|             |  Total  |  ANE  |  GPU  |  DRAM |\n|             |  %6.2f | %5.1f | %5.1f | %5.1f |\n| Energy (J)  -----------------------------------\n| %s     |         |  ECPU |  PCPU | OTHER |\n|             |         | %5.1f | %5.1f | %5.1f |\n|------------------------------------------------\n|             |  Total  |  ANE  |  GPU  |  DRAM |\n|             |   %5d |  %4d |  %4d |  %4d |\n| Power (mW)  -----------------------------------\n| %s     |         |  ECPU |  PCPU | OTHER |\n| ^           |         |  %4d |  %4d |  %4d |\n=================================================\n| * If Idle power consumption is significant,   |\n|   try enabling one of the power settings      |\n"
      "|   recommended  above and kill any daemon(s)   |\n"
      "|   that are not needed by transcribe.          |\n"
      "| ^ Power measurements can be inaccurate on     |\n"
      "|   short audios and/or new hardwares.          |\n"
      "=================================================\n",
      v12,
      v16,
      v18,
      v29[0],
      v29[1],
      gpu_energy,
      dram_energy,
      v21,
      *(double *)&v28,
      *((double *)&v28 + 1),
      other_energy,
      total_power,
      ane_power,
      gpu_power,
      dram_power,
      v27,
      (int)self->_power_summary.ecpu_power,
      (int)self->_power_summary.pcpu_power,
      (int)self->_power_summary.other_power);
  }
}

- (void)cleanupLogfiles
{
  id v3;
  char *v4;
  void *__p[2];
  char v6;
  pid_t v7;
  posix_spawn_file_actions_t v8[2];
  char *v9[5];

  v9[4] = *(char **)MEMORY[0x1E0C80C00];
  if (!-[_EARProfiler _keepLogFiles](self, "_keepLogFiles"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rm %@ %@"), self->_background_power_logfile_name, self->_runtime_power_logfile_name);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v3, "UTF8String"));
    v8[0] = 0;
    posix_spawn_file_actions_init(v8);
    posix_spawn_file_actions_addopen(v8, 1, "/dev/null", 0, 0);
    posix_spawn_file_actions_addopen(v8, 2, "/dev/null", 0, 0);
    v7 = 0;
    v8[1] = "/usr/bin/sudo";
    v9[0] = "/bin/bash";
    v4 = (char *)__p;
    if (v6 < 0)
      v4 = (char *)__p[0];
    v9[1] = "-c";
    v9[2] = v4;
    v9[3] = 0;
    posix_spawn(&v7, "/bin/bash", v8, 0, v9, 0);
    posix_spawn_file_actions_destroy(v8);
    if (v6 < 0)
      operator delete(__p[0]);

  }
}

- (void)parsePowerSummary:(id)a3 writeTo:(powerSummary *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  char v15;
  const __CFString *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  char v27;
  double *p_ane_energy;
  double *p_ane_power;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  int v35;
  int v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  *(_OWORD *)&a4->total_energy = 0u;
  *(_OWORD *)&a4->gpu_energy = 0u;
  *(_OWORD *)&a4->pcpu_energy = 0u;
  *(_OWORD *)&a4->other_energy = 0u;
  *(_OWORD *)&a4->ane_power = 0u;
  *(_OWORD *)&a4->ecpu_power = 0u;
  *(_OWORD *)&a4->dram_power = 0u;
  v38 = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "componentsSeparatedByString:", CFSTR("\n"));
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v40;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (-[_EARProfiler _hasPMP](self, "_hasPMP"))
        {
          v15 = objc_msgSend(v14, "containsString:", CFSTR("---> "));
          v16 = CFSTR("---> Energy Counters");
          if ((v15 & 1) != 0)
            goto LABEL_33;
        }
        else
        {
          v36 = objc_msgSend(v14, "containsString:", CFSTR("=> "));
          v16 = CFSTR("=> Energy Model");
          if (v36)
          {
LABEL_33:
            v9 = objc_msgSend(v14, "containsString:", v16);
            continue;
          }
        }
        if ((v9 & 1) != 0)
        {
          v17 = 1.0;
          if ((objc_msgSend(v14, "containsString:", CFSTR("mW]")) & 1) == 0)
          {
            v17 = 0.001;
            if ((objc_msgSend(v14, "containsString:", CFSTR("uW]")) & 1) == 0)
            {
              if (objc_msgSend(v14, "containsString:", CFSTR("nW]")))
                v17 = 0.000001;
              else
                v17 = 0.0;
            }
          }
          v18 = 0.001;
          if ((objc_msgSend(v14, "containsString:", CFSTR("mJ")) & 1) == 0)
          {
            v18 = 0.000001;
            if ((objc_msgSend(v14, "containsString:", CFSTR("uJ")) & 1) == 0)
            {
              if (objc_msgSend(v14, "containsString:", CFSTR("nJ")))
                v18 = 0.000000001;
              else
                v18 = 0.0;
            }
          }
          objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\\s+"), CFSTR(" "), 1024, 0, objc_msgSend(v14, "length"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "componentsSeparatedByString:", CFSTR(" "));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v20, "count") >= 7)
          {
            objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "doubleValue");
            v23 = v22;

            objc_msgSend(v20, "objectAtIndexedSubscript:", 5);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "doubleValue");
            v26 = v25;

            v12 = v18 * v23;
            v11 = v17 * v26;
          }
          a4->total_energy = v12 + a4->total_energy;
          a4->total_power = v11 + a4->total_power;
          v27 = objc_msgSend(v14, "containsString:", CFSTR("ANE"));
          p_ane_power = &a4->ane_power;
          p_ane_energy = &a4->ane_energy;
          if ((v27 & 1) == 0)
          {
            v30 = objc_msgSend(v14, "containsString:", CFSTR("GPU"));
            p_ane_power = &a4->gpu_power;
            p_ane_energy = &a4->gpu_energy;
            if ((v30 & 1) == 0)
            {
              v31 = objc_msgSend(v14, "containsString:", CFSTR("ECPU"));
              p_ane_power = &a4->ecpu_power;
              p_ane_energy = &a4->ecpu_energy;
              if ((v31 & 1) == 0)
              {
                v32 = objc_msgSend(v14, "containsString:", CFSTR("ECORE"));
                p_ane_power = &a4->ecpu_power;
                p_ane_energy = &a4->ecpu_energy;
                if ((v32 & 1) == 0)
                {
                  v33 = objc_msgSend(v14, "containsString:", CFSTR("PCPU"));
                  p_ane_power = &a4->pcpu_power;
                  p_ane_energy = &a4->pcpu_energy;
                  if ((v33 & 1) == 0)
                  {
                    v34 = objc_msgSend(v14, "containsString:", CFSTR("PCORE"));
                    p_ane_power = &a4->pcpu_power;
                    p_ane_energy = &a4->pcpu_energy;
                    if ((v34 & 1) == 0)
                    {
                      v35 = objc_msgSend(v14, "containsString:", CFSTR("DRAM"));
                      p_ane_energy = &a4->other_energy;
                      if (v35)
                        p_ane_energy = &a4->dram_energy;
                      p_ane_power = &a4->other_power;
                      if (v35)
                        p_ane_power = &a4->dram_power;
                    }
                  }
                }
              }
            }
          }
          *p_ane_energy = v12 + *p_ane_energy;
          *p_ane_power = v11 + *p_ane_power;

          v9 = 1;
        }
        else
        {
          v9 = 0;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v8);
  }

}

- (BOOL)_memoryProfiler
{
  return self->__memoryProfiler;
}

- (void)set_memoryProfiler:(BOOL)a3
{
  self->__memoryProfiler = a3;
}

- (BOOL)_perfProfiler
{
  return self->__perfProfiler;
}

- (void)set_perfProfiler:(BOOL)a3
{
  self->__perfProfiler = a3;
}

- (BOOL)_powerProfiler
{
  return self->__powerProfiler;
}

- (void)set_powerProfiler:(BOOL)a3
{
  self->__powerProfiler = a3;
}

- (BOOL)_hasPMP
{
  return self->__hasPMP;
}

- (void)set_hasPMP:(BOOL)a3
{
  self->__hasPMP = a3;
}

- (BOOL)_keepLogFiles
{
  return self->__keepLogFiles;
}

- (void)set_keepLogFiles:(BOOL)a3
{
  self->__keepLogFiles = a3;
}

- (void).cxx_destruct
{
  void **begin;
  float *v4;

  objc_storeStrong((id *)&self->_runtime_power_logfile_name, 0);
  objc_storeStrong((id *)&self->_background_power_logfile_name, 0);
  objc_storeStrong((id *)&self->_power_profiler_name, 0);
  begin = self->_networks.__begin_;
  if (begin)
  {
    self->_networks.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_background_power.__begin_;
  if (v4)
  {
    self->_background_power.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end
