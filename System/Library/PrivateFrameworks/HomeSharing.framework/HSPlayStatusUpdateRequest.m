@implementation HSPlayStatusUpdateRequest

- (HSPlayStatusUpdateRequest)initWithInterfaceID:(unsigned int)a3 revisionID:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  HSPlayStatusUpdateRequest *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/%u/%s"), "ctrl-int", *(_QWORD *)&a3, "playstatusupdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HSRequest initWithAction:](self, "initWithAction:", v7);

  if (v8)
  {
    v8->_interfaceID = a3;
    v8->_revisionID = v4;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSRequest setValue:forArgument:](v8, "setValue:forArgument:", v9, CFSTR("revision-number"));

  }
  return v8;
}

- (id)canonicalResponseForResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 *v9;
  void *v10;
  unsigned int *v11;

  +[HSResponse responseWithResponse:](HSPlayStatusUpdateResponse, "responseWithResponse:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HSResponseDataParser parseResponseData:](HSResponseDataParser, "parseResponseData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "objectForKey:", &unk_24C36DBA8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNextRevisionID:", objc_msgSend(v7, "unsignedIntValue"));

  objc_msgSend(v6, "objectForKey:", &unk_24C36DBC0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length") == 32)
  {
    v9 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
    objc_msgSend(v3, "setNowPlayingDatabaseID:", (((unint64_t)*v9 << 56) | ((unint64_t)v9[1] << 48) | ((unint64_t)v9[2] << 40) | ((unint64_t)v9[3] << 32) | ((unint64_t)v9[4] << 24) | ((unint64_t)v9[5] << 16) | ((unint64_t)v9[6] << 8))+ v9[7]);
    objc_msgSend(v3, "setNowPlayingContainerID:", (((unint64_t)v9[8] << 56) | ((unint64_t)v9[9] << 48) | ((unint64_t)v9[10] << 40) | ((unint64_t)v9[11] << 32) | ((unint64_t)v9[12] << 24) | ((unint64_t)v9[13] << 16) | ((unint64_t)v9[14] << 8))+ v9[15]);
    objc_msgSend(v3, "setNowPlayingContainerItemID:", (((unint64_t)v9[16] << 56) | ((unint64_t)v9[17] << 48) | ((unint64_t)v9[18] << 40) | ((unint64_t)v9[19] << 32) | ((unint64_t)v9[20] << 24) | ((unint64_t)v9[21] << 16) | ((unint64_t)v9[22] << 8))+ v9[23]);
    objc_msgSend(v3, "setNowPlayingItemID:", (((unint64_t)v9[24] << 56) | ((unint64_t)v9[25] << 48) | ((unint64_t)v9[26] << 40) | ((unint64_t)v9[27] << 32) | ((unint64_t)v9[28] << 24) | ((unint64_t)v9[29] << 16) | ((unint64_t)v9[30] << 8))+ v9[31]);
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", &unk_24C36DBD8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length") == 16)
    {
      v11 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
      objc_msgSend(v3, "setNowPlayingDatabaseID:", bswap32(*v11));
      objc_msgSend(v3, "setNowPlayingContainerID:", bswap32(v11[1]));
      objc_msgSend(v3, "setNowPlayingContainerItemID:", bswap32(v11[2]));
      objc_msgSend(v3, "setNowPlayingItemID:", bswap32(v11[3]));
    }

  }
  objc_msgSend(v3, "setPlayStatusInformation:", v6);

  return v3;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (double)timeoutInterval
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3;

  return v4;
}

- (unsigned)interfaceID
{
  return self->_interfaceID;
}

- (unsigned)revisionID
{
  return self->_revisionID;
}

@end
