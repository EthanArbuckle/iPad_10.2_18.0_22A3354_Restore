@implementation ABTachogramClassifier

- (ABTachogramClassifier)init
{
  id v2;
  Tellurium::tellurium_classifier_t *v3;
  ABTachogramClassifier *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABTachogramClassifier;
  v2 = -[ABTachogramClassifier init](&v6, sel_init);
  if (v2
    && (espresso_enable_autoinitialize(),
        v3 = (Tellurium::tellurium_classifier_t *)operator new(),
        Tellurium::tellurium_classifier_t::tellurium_classifier_t(v3, 5u, 2u, 1),
        std::unique_ptr<Tellurium::tellurium_classifier_t>::reset[abi:ne180100]((id ***)v2 + 1, (id **)v3),
        *((_QWORD *)v2 + 1)))
  {
    v4 = (ABTachogramClassifier *)v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)classifyTachogram:(id)a3
{
  id v4;
  uint64_t v5;
  const unsigned __int8 ***v6;
  uint64_t *v7;
  const unsigned __int8 **v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v23[6];
  void **v24;
  void ***v25;
  uint64_t v26;
  __n128 (*v27)(__n128 *, __n128 *);
  void (*v28)(uint64_t);
  const char *v29;
  void *__p;
  void *v31;
  uint64_t v32;
  const unsigned __int8 *v33;
  unint64_t v34;
  unint64_t v35;
  _OWORD buf[2];
  const unsigned __int8 **v37;
  const unsigned __int8 ***v38;
  uint64_t v39;
  __n128 (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  const char *v42;
  _QWORD v43[7];

  v43[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x6012000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  v42 = "";
  memset(v43, 0, 24);
  v24 = 0;
  v25 = &v24;
  v26 = 0x4812000000;
  v27 = __Block_byref_object_copy__207;
  v28 = __Block_byref_object_dispose__208;
  v29 = "";
  __p = 0;
  v31 = 0;
  v32 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __43__ABTachogramClassifier_classifyTachogram___block_invoke;
  v23[3] = &unk_250758D90;
  v23[4] = &v24;
  v23[5] = &v37;
  objc_msgSend(v4, "_enumerateHeartbeatDataWithBlock:", v23);
  v5 = (uint64_t)(v25 + 6);
  if (v25[6] != v25[7])
  {
    v6 = v38;
    v7 = (uint64_t *)(v38 + 6);
    v8 = v38[7];
    if (v8 >= v38[8])
    {
      v9 = std::vector<std::vector<double>>::__push_back_slow_path<std::vector<double> const&>(v7, v5);
    }
    else
    {
      std::vector<std::vector<double>>::__construct_one_at_end[abi:ne180100]<std::vector<double> const&>((uint64_t)v7, v5);
      v9 = (uint64_t)(v8 + 3);
    }
    v6[7] = (const unsigned __int8 **)v9;
    v25[7] = v25[6];
  }
  if (v38[6] == v38[7])
  {
    ab_get_framework_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[ABTachogramClassifier classifyTachogram:].cold.1(v17);

    v18 = 0;
  }
  else
  {
    objc_msgSend(v4, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getUUIDBytes:", v38 + 10);

    ab_get_framework_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0]) = 138412290;
      *(_QWORD *)((char *)buf + 4) = v12;
      _os_log_impl(&dword_235FAB000, v11, OS_LOG_TYPE_DEFAULT, "Classifying tachogram with UUID : %@", (uint8_t *)buf, 0xCu);

    }
    objc_msgSend(v4, "_startTimestamp");
    v14 = (uint64_t)(v38 + 6);
    v38[9] = (const unsigned __int8 **)v13;
    v15 = v34;
    if (v34 >= v35)
    {
      v16 = std::vector<Tellurium::tellurium_input_t>::__push_back_slow_path<Tellurium::tellurium_input_t const&>((uint64_t *)&v33, v14);
    }
    else
    {
      std::vector<Tellurium::tellurium_input_t>::__construct_one_at_end[abi:ne180100]<Tellurium::tellurium_input_t const&>((uint64_t)&v33, v14);
      v16 = v15 + 48;
    }
    v34 = v16;
    Tellurium::tellurium_classifier_t::tellurium_classifier_process((uint64_t)self->_classifier.__ptr_.__value_, &v33);
    Tellurium::tellurium_classifier_t::tellurium_get_outputs((Tellurium::tellurium_classifier_t *)self->_classifier.__ptr_.__value_, (uint64_t)buf);
    if (*((_QWORD *)&buf[0] + 1) - *(_QWORD *)&buf[0] == 17)
    {
      v19 = objc_opt_new();
      if (v19)
      {
        objc_msgSend(v4, "UUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setUuid:](v19, "setUuid:", v20);

        objc_msgSend(v4, "startDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setDate:](v19, "setDate:", v21);

        -[NSObject setAFibDetected:](v19, "setAFibDetected:", *(unsigned __int8 *)(*(_QWORD *)&buf[0] + 16));
        -[ABTachogramClassifier logToFileForTacho:withClassification:](self, "logToFileForTacho:withClassification:", v38 + 6, v19);
        v19 = v19;
        v18 = v19;
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      ab_get_framework_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[ABTachogramClassifier classifyTachogram:].cold.2((_QWORD *)buf + 1, buf, v19);
      v18 = 0;
    }

    if (*(_QWORD *)&buf[0])
    {
      *((_QWORD *)&buf[0] + 1) = *(_QWORD *)&buf[0];
      operator delete(*(void **)&buf[0]);
    }
  }
  _Block_object_dispose(&v24, 8);
  if (__p)
  {
    v31 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v37, 8);
  v24 = (void **)v43;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v24);
  v37 = &v33;
  std::vector<Tellurium::tellurium_input_t>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);

  return v18;
}

uint64_t __43__ABTachogramClassifier_classifyTachogram___block_invoke(uint64_t a1, int a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  double *v14;
  unint64_t v15;
  double *v16;
  double *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  double *v23;
  char *v24;
  uint64_t v25;

  if (a2)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(_QWORD *)(v5 + 48);
    v8 = *(_QWORD *)(v5 + 56);
    v6 = v5 + 48;
    if (v8 != v7)
    {
      v9 = *(uint64_t **)(*(_QWORD *)(a1 + 40) + 8);
      v10 = v9 + 6;
      v11 = v9[7];
      if (v11 >= v9[8])
      {
        v12 = std::vector<std::vector<double>>::__push_back_slow_path<std::vector<double> const&>(v10, v6);
      }
      else
      {
        std::vector<std::vector<double>>::__construct_one_at_end[abi:ne180100]<std::vector<double> const&>((uint64_t)v10, v6);
        v12 = v11 + 24;
      }
      v9[7] = v12;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                              + 48);
    }
  }
  v13 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v14 = (double *)v13[7];
  v15 = v13[8];
  if ((unint64_t)v14 >= v15)
  {
    v17 = (double *)v13[6];
    v18 = v14 - v17;
    if ((unint64_t)(v18 + 1) >> 61)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v19 = v15 - (_QWORD)v17;
    v20 = (uint64_t)(v15 - (_QWORD)v17) >> 2;
    if (v20 <= v18 + 1)
      v20 = v18 + 1;
    if (v19 >= 0x7FFFFFFFFFFFFFF8)
      v21 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v21 = v20;
    if (v21)
    {
      v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(v13 + 8), v21);
      v17 = (double *)v13[6];
      v14 = (double *)v13[7];
    }
    else
    {
      v22 = 0;
    }
    v23 = (double *)&v22[8 * v18];
    v24 = &v22[8 * v21];
    *v23 = a3;
    v16 = v23 + 1;
    while (v14 != v17)
    {
      v25 = *((_QWORD *)v14-- - 1);
      *((_QWORD *)v23-- - 1) = v25;
    }
    v13[6] = v23;
    v13[7] = v16;
    v13[8] = v24;
    if (v17)
      operator delete(v17);
  }
  else
  {
    *v14 = a3;
    v16 = v14 + 1;
  }
  v13[7] = v16;
  return 1;
}

- (void)logToFileForTacho:(const void *)a3 withClassification:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  std::string *v11;
  __int128 v12;
  std::string *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  char *v20;
  NSObject *v21;
  std::string __p[2];
  char *v23;
  _BYTE v24[8];
  uint64_t *v25;
  _BYTE v26[8];
  uint64_t *v27[3];
  char v28;
  void *v29[2];
  std::string::size_type v30;
  id v31;
  uint64_t state64;
  int out_token;
  std::string buf[17];
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  out_token = -1;
  notify_register_check("com.apple.AfibBurden.ForceAnalysis.WriteToJson", &out_token);
  state64 = 0;
  notify_get_state(out_token, &state64);
  if (state64)
  {
    ab_get_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0].__r_.__value_.__l.__data_) = 134217984;
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = state64;
      _os_log_impl(&dword_235FAB000, v6, OS_LOG_TYPE_DEFAULT, "ABTachogramClassifier : logging to file. notifyState is set to %llu", (uint8_t *)buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x24BDD0CF0];
    v37[0] = *MEMORY[0x24BDD0CD8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v9 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/Logs/AfBHIDDiagnostics/"), 1, v8, &v31);
    v10 = v31;

    if ((v9 & 1) != 0)
    {
      std::to_string(__p, state64);
      v11 = std::string::insert(__p, 0, "process_tacho_");
      v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      buf[0].__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
      *(_OWORD *)&buf[0].__r_.__value_.__l.__data_ = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      v13 = std::string::append(buf, ".json");
      v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
      v30 = v13->__r_.__value_.__r.__words[2];
      *(_OWORD *)v29 = v14;
      v13->__r_.__value_.__l.__size_ = 0;
      v13->__r_.__value_.__r.__words[2] = 0;
      v13->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf[0].__r_.__value_.__l.__data_);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p[0].__r_.__value_.__l.__data_);
      objc_msgSend(CFSTR("/var/mobile/Library/Logs/AfBHIDDiagnostics/"), "UTF8String");
      std::operator+<char>();
      std::ofstream::basic_ofstream(buf);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v26, 0, 0, 0, 2);
      v15 = *(_QWORD *)a3;
      v16 = *((_QWORD *)a3 + 1);
      if (*(_QWORD *)a3 != v16)
      {
        do
        {
          __p[0].__r_.__value_.__s.__data_[0] = 0;
          __p[0].__r_.__value_.__l.__size_ = 0;
          nlohmann::detail::external_constructor<(nlohmann::detail::value_t)2>::construct<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,std::vector<double>,0>((uint64_t)__p, v15);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)__p);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v26, (uint64_t)__p);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)__p);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&__p[0].__r_.__value_.__l.__size_, __p[0].__r_.__value_.__s.__data_[0]);
          v15 += 24;
        }
        while (v15 != v16);
      }
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v24, 0, 0, 0, 1);
      objc_msgSend(v5, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = (char *)objc_msgSend(v18, "UTF8String");
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[5],char const*>((uint64_t)v24, "uuid", &v23, (uint64_t)__p);

      objc_msgSend(v5, "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSince1970");
      v23 = v20;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[10],double>((uint64_t)v24, "startDate", (uint64_t *)&v23, (uint64_t)__p);

      LOBYTE(v23) = objc_msgSend(v5, "aFibDetected");
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[13],BOOL>((uint64_t)v24, "afibDetected", (unsigned __int8 *)&v23, (uint64_t)__p);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v24, "pulseSequences", (uint64_t)v26, (uint64_t)__p);
      nlohmann::operator<<((uint64_t *)buf, (uint64_t)v24);
      __p[0].__r_.__value_.__s.__data_[0] = 10;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)__p, 1);
      notify_cancel(out_token);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v24);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v25, v24[0]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v27, v26[0]);
      buf[0].__r_.__value_.__r.__words[0] = *MEMORY[0x24BEDB7E8];
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words
                                + *(_QWORD *)(buf[0].__r_.__value_.__r.__words[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 24);
      MEMORY[0x23B7E7FD4](&buf[0].__r_.__value_.__r.__words[1]);
      std::ostream::~ostream();
      MEMORY[0x23B7E8064](&v35);
      if (v28 < 0)
        operator delete(v27[1]);
      if (SHIBYTE(v30) < 0)
        operator delete(v29[0]);
    }
    else
    {
      ab_get_framework_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[ABTachogramClassifier logToFileForTacho:withClassification:].cold.1((uint64_t)v10, v21);

      notify_cancel(out_token);
    }

  }
  else
  {
    notify_cancel(out_token);
  }

}

- (void).cxx_destruct
{
  std::unique_ptr<Tellurium::tellurium_classifier_t>::reset[abi:ne180100]((id ***)&self->_classifier, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)classifyTachogram:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_235FAB000, log, OS_LOG_TYPE_FAULT, "pulse times inside HKHeartbeatSeriesSample is empty", v1, 2u);
}

- (void)classifyTachogram:(os_log_t)log .cold.2(_QWORD *a1, _QWORD *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (*a1 - *a2) / 17;
  v4 = 134217984;
  v5 = v3;
  _os_log_fault_impl(&dword_235FAB000, log, OS_LOG_TYPE_FAULT, "Unexpected length of output classifications received from TelluriumForBeryllium computation. Expected : 1, Observed : %lu", (uint8_t *)&v4, 0xCu);
}

- (void)logToFileForTacho:(uint64_t)a1 withClassification:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_235FAB000, a2, OS_LOG_TYPE_ERROR, "failed to create directory: %@", (uint8_t *)&v2, 0xCu);
}

@end
