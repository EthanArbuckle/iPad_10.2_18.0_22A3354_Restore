@implementation Z16

void *___Z16_factoryInstancev_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *__p[2];
  char v13;

  v11 = operator new();
  v0 = (void *)MEMORY[0x1E0CB3940];
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hardwareClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "osVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@_%@.%@_%@"), v2, v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSString stdString](__p, v9);
  qword_1ECDBCBB8 = addr_obj::AddressObjectFactory::AddressObjectFactory(v11, __p);
  if (v13 < 0)
    operator delete(__p[0]);

  addr_obj::Debugging::addChar(+[GEOAddressObject isMarkingMMStrings](GEOAddressObject, "isMarkingMMStrings"));
  return addr_obj::Logger::setCallback(_GEOLogFromMM);
}

@end
