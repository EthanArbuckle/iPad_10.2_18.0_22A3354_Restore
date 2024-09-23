@implementation W5AWDLStatus(Strings)

- (id)awdlOpModeString
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  unsigned int v5;
  const char *v6;
  void *v7;

  v1 = a1;
  objc_msgSend(a1, "awdlOpMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v1, "awdlOpMode");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = *(_DWORD *)(objc_msgSend(v4, "bytes") + 4);
    if (v5 > 2)
    {
      v6 = "Unknown";
    }
    else
    {
      objc_msgSend(v1, "awdlOpMode");
      v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = awdlOpModeString_modestr_0[*(unsigned int *)(objc_msgSend(v1, "bytes") + 4)];
    }
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%s"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 <= 2)

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)awdlScheduleString
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "awdlStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "awdlStrategy");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "bytes");
    W5DescriptionForAWDLScheduleState();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)awdlSyncChannelSequenceString
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "awdlSyncChannelSequence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "awdlSyncChannelSequence");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "bytes");
    W5DescriptionForAWDLSyncChannelSequence();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)awdlMasterChannelString
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "awdlMasterChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "awdlMasterChannel");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%i"), *(unsigned int *)(objc_msgSend(v4, "bytes") + 4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)awdlSecondaryMasterChannelString
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "awdlSecondaryMasterChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "awdlSecondaryMasterChannel");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%i"), *(unsigned int *)(objc_msgSend(v4, "bytes") + 4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)awdlSyncStateString
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "awdlSyncState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "awdlSyncState");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "bytes");
    W5DescriptionForAWDLSyncState();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)awdlElectionParametersString
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "awdlElectionParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "awdlElectionParameters");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%i"), *(unsigned int *)(objc_msgSend(v4, "bytes") + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)dictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "power"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("awdl_power_state"));

  objc_msgSend(a1, "awdlOpModeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("awdl_op_mode"));

  objc_msgSend(a1, "awdlScheduleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("awdl_schedule"));

  objc_msgSend(a1, "awdlSyncChannelSequenceString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("awdl_sync_channel_sequence"));

  objc_msgSend(a1, "awdlMasterChannelString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("awdl_master_channel"));

  objc_msgSend(a1, "awdlSecondaryMasterChannelString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("awdl_secondary_master_channel"));

  objc_msgSend(a1, "awdlSyncStateString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("awdl_sync_state"));

  objc_msgSend(a1, "awdlElectionParametersString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("awdl_election_parameters"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
