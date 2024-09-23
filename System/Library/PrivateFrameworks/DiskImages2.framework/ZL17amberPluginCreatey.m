@implementation ZL17amberPluginCreatey

uint64_t (*___ZL17amberPluginCreatey_block_invoke())(_QWORD)
{
  void *v0;
  uint64_t (*result)(_QWORD);
  __int128 v2;
  int v3;
  _QWORD v4[45];
  uint64_t v5;
  uint64_t v6;

  v0 = dlopen("/usr/lib/libAmber.dylib", 5);
  if (v0)
  {
    result = (uint64_t (*)(_QWORD))dlsym(v0, "AmberDiskImagePluginCreate");
    amberPluginCreate(unsigned long long)::AmberDiskImagePluginCreate = result;
    if (result)
      return result;
    *(_QWORD *)&v2 = "*amberPluginCreate(uint64_t)_block_invoke";
    *((_QWORD *)&v2 + 1) = 18;
    v3 = 16;
    di_log::logger<di_log::log_printer<58ul>>::logger(v4, &v2);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"Cannot find AmberDiskImagePluginCreate in libAmber", 50);
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<58ul>>::~logger_buf((uint64_t)v4);
  }
  else
  {
    *(_QWORD *)&v2 = "*amberPluginCreate(uint64_t)_block_invoke";
    *((_QWORD *)&v2 + 1) = 18;
    v3 = 16;
    di_log::logger<di_log::log_printer<52ul>>::logger(v4, &v2);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"Cannot load libAmber", 20);
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<52ul>>::~logger_buf((uint64_t)v4);
  }
  return (uint64_t (*)(_QWORD))MEMORY[0x2199A89AC](&v6);
}

@end
