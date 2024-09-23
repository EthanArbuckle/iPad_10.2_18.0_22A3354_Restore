@implementation DSError

+ (id)errorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "errorWithCode:underlyingErrors:", a3, MEMORY[0x24BDBD1A8]);
}

+ (id)errorWithCode:(int64_t)a3 sourceName:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:sourceName:underlyingErrors:", a3, a4, MEMORY[0x24BDBD1A8]);
}

+ (id)errorWithCode:(int64_t)a3 appName:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:appName:serviceName:underlyingErrors:", a3, a4, 0, MEMORY[0x24BDBD1A8]);
}

+ (id)errorWithCode:(int64_t)a3 serviceName:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:appName:serviceName:underlyingErrors:", a3, 0, a4, MEMORY[0x24BDBD1A8]);
}

+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:sourceName:underlyingErrors:", a3, 0, a4);
}

+ (id)errorWithCode:(int64_t)a3 sourceName:(id)a4 underlyingErrors:(id)a5
{
  id v7;
  id v8;
  char v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a4;
  v8 = a5;
  switch(a3)
  {
    case 1:
      v9 = 0;
      v10 = CFSTR("Fetch sharing failed");
      break;
    case 2:
      v9 = 0;
      v10 = CFSTR("Stop sharing failed");
      break;
    case 3:
      v9 = 0;
      v10 = CFSTR("Fetch app permissions failed");
      break;
    case 4:
      v9 = 0;
      v10 = CFSTR("Reset app permissions failed");
      break;
    case 5:
      v9 = 0;
      v10 = CFSTR("Data usage policy was not met");
      break;
    case 6:
    case 7:
    case 8:
      v9 = 0;
      v10 = CFSTR("Failed to stop sharing due to device restrictions");
      break;
    case 9:
      v9 = 0;
      v10 = CFSTR("Removing paired hosts failed.");
      break;
    case 10:
      v9 = 0;
      v10 = CFSTR("Unpairing hosts for Continuity failed.");
      break;
    default:
      v10 = 0;
      v9 = 1;
      break;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v9 & 1) == 0)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD0FC8]);
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD10D8]);
  if (v7)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("DSErrorKeySourceName"));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", DSErrorDomain, a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)errorWithCode:(int64_t)a3 appName:(id)a4 serviceName:(id)a5 underlyingErrors:(id)a6
{
  id v9;
  id v10;
  id v11;
  char v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  switch(a3)
  {
    case 1:
      v12 = 0;
      v13 = CFSTR("Fetch sharing failed");
      break;
    case 2:
      v12 = 0;
      v13 = CFSTR("Stop sharing failed");
      break;
    case 3:
      v12 = 0;
      v13 = CFSTR("Fetch app permissions failed");
      break;
    case 4:
      v12 = 0;
      v13 = CFSTR("Reset app permissions failed");
      break;
    case 5:
      v12 = 0;
      v13 = CFSTR("Data usage policy was not met");
      break;
    case 6:
    case 7:
    case 8:
      v12 = 0;
      v13 = CFSTR("Failed to stop sharing due to device restrictions");
      break;
    case 9:
      v12 = 0;
      v13 = CFSTR("Removing paired hosts failed.");
      break;
    case 10:
      v12 = 0;
      v13 = CFSTR("Unpairing hosts for Continuity failed.");
      break;
    default:
      v13 = 0;
      v12 = 1;
      break;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v12 & 1) == 0)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD0FC8]);
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD10D8]);
  if (v9)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("DSErrorKeyAppName"));
  if (v10)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("DSErrorKeyServiceName"));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", DSErrorDomain, a3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
