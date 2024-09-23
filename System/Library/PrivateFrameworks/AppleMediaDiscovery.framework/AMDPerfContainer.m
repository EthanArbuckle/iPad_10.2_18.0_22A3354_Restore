@implementation AMDPerfContainer

- (AMDPerfContainer)initWithSwitch:(BOOL)a3 atLevel:(char)a4
{
  unint64_t v4;
  unint64_t v5;
  id v7;
  id v8;
  id v9;
  AMDPerfContainer *v10;
  mach_timebase_info info;
  objc_super v12;
  char v13;
  BOOL v14;
  SEL v15;
  AMDPerfContainer *v16;

  v15 = a2;
  v14 = a3;
  v13 = a4;
  v16 = 0;
  v12.receiver = self;
  v12.super_class = (Class)AMDPerfContainer;
  v16 = -[AMDPerfContainer init](&v12, sel_init);
  objc_storeStrong((id *)&v16, v16);
  -[AMDPerfContainer setIsEnabled:](v16, "setIsEnabled:", v14);
  -[AMDPerfContainer setLevel:](v16, "setLevel:", v13);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMDPerfContainer setMemoryUsage:](v16, "setMemoryUsage:");

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMDPerfContainer setTimeUsage:](v16, "setTimeUsage:");

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMDPerfContainer setSamples:](v16, "setSamples:");

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v5) = info.denom;
  LODWORD(v4) = info.numer;
  -[AMDPerfContainer setTimeConversionFactor:](v16, "setTimeConversionFactor:", (double)v4 / (1000000000.0 * (double)v5));
  v10 = v16;
  objc_storeStrong((id *)&v16, 0);
  return v10;
}

- (double)getTime
{
  double v2;
  double v4;

  v4 = (double)mach_absolute_time();
  -[AMDPerfContainer timeConversionFactor](self, "timeConversionFactor");
  return v4 * v2;
}

+ (float)getMemoryUsage:(id)a3 logType:(id)a4 timeDelta:(double)a5
{
  float v5;
  char *v6;
  os_log_t v10;
  int v11;
  os_log_type_t type;
  os_log_t oslog;
  unint64_t v14;
  mach_error_t error_value;
  mach_msg_type_number_t task_info_outCnt;
  integer_t v17[12];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id location[3];
  float v23;
  uint8_t v24[16];
  uint8_t v25[56];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = *(_QWORD *)&a5;
  bzero(v17, 0x174uLL);
  task_info_outCnt = 93;
  error_value = 0;
  error_value = task_info(*MEMORY[0x1E0C83DA0], 0x16u, v17, &task_info_outCnt);
  if (error_value)
  {
    v10 = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v6 = mach_error_string(error_value);
      __os_log_helper_16_2_1_8_32((uint64_t)v24, (uint64_t)v6);
      _os_log_error_impl(&dword_1DC678000, v10, OS_LOG_TYPE_ERROR, "Error retrieving task_info: %s", v24, 0xCu);
    }
    objc_storeStrong((id *)&v10, 0);
    v23 = 0.0;
    v11 = 1;
  }
  else
  {
    v14 = v18 + v19;
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_4_8_64_8_64_8_0_8_0((uint64_t)v25, (uint64_t)location[0], (uint64_t)v21, COERCE__INT64((double)v14 / 1048576.0), v20);
      _os_log_impl(&dword_1DC678000, oslog, type, "%@ %@: memory usage: %f MB, timeDelta: %.3f", v25, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    v5 = (double)v14 / 1048576.0;
    v23 = v5;
    v11 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v23;
}

- (NSMutableDictionary)memoryUsage
{
  return self->_memoryUsage;
}

- (void)setMemoryUsage:(id)a3
{
  objc_storeStrong((id *)&self->_memoryUsage, a3);
}

- (NSMutableDictionary)timeUsage
{
  return self->_timeUsage;
}

- (void)setTimeUsage:(id)a3
{
  objc_storeStrong((id *)&self->_timeUsage, a3);
}

- (NSMutableDictionary)samples
{
  return self->_samples;
}

- (void)setSamples:(id)a3
{
  objc_storeStrong((id *)&self->_samples, a3);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (char)level
{
  return self->_level;
}

- (void)setLevel:(char)a3
{
  self->_level = a3;
}

- (double)timeConversionFactor
{
  return self->_timeConversionFactor;
}

- (void)setTimeConversionFactor:(double)a3
{
  self->_timeConversionFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_timeUsage, 0);
  objc_storeStrong((id *)&self->_memoryUsage, 0);
}

@end
