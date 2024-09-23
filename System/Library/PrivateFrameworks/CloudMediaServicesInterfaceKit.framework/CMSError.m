@implementation CMSError

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[CMSError _descriptionForErrorCode:](CMSError, "_descriptionForErrorCode:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMSError errorWithDomain:code:description:](CMSError, "errorWithDomain:code:description:", v5, a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDD1540];
  v14 = *MEMORY[0x24BDD0FC8];
  v15[0] = a5;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v10, a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_descriptionForErrorCode:(int64_t)a3
{
  id result;

  if (a3 <= 999)
  {
    switch(a3)
    {
      case 1:
        return CFSTR("Invalid XPC connection");
      case 2:
        return CFSTR("Unsupported parameter value passed");
      case 3:
        return CFSTR("ImageURL is Nil");
      default:
        return CFSTR("Unknown error occurred");
    }
  }
  else
  {
    switch(a3)
    {
      case 1000:
        result = CFSTR("Playback queue unavailable");
        break;
      case 1001:
        result = CFSTR("Remote destination not found");
        break;
      case 1002:
        result = CFSTR("Send Playback Queue failed");
        break;
      case 1003:
        result = CFSTR("Multi stream limit reached");
        break;
      case 1004:
        result = CFSTR("Maximum number of content items allowed in a single queue segment exceeded");
        break;
      default:
        return CFSTR("Unknown error occurred");
    }
  }
  return result;
}

@end
