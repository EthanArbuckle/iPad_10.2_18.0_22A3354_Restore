@implementation CTDataStatus(Strings)

- (const)radioTechnologyString
{
  unsigned int v1;

  v1 = objc_msgSend(a1, "radioTechnology");
  if (v1 > 0xA)
    return CFSTR("unknown");
  else
    return off_24C991158[v1];
}

- (const)dataBearerTechnologyString
{
  unsigned int v1;

  v1 = objc_msgSend(a1, "dataBearerTechnology") - 1;
  if (v1 > 5)
    return CFSTR("unknown");
  else
    return off_24C9911B0[v1];
}

- (const)indicatorString
{
  return indicatorToString(objc_msgSend(a1, "indicator"));
}

- (const)indicatorOverrideString
{
  return indicatorToString(objc_msgSend(a1, "indicatorOverride"));
}

- (const)radioFrequencyString
{
  const __CFString *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(a1, "newRadioSub6DataBearer"))
      v2 = CFSTR("FR1");
    else
      v2 = 0;
  }
  else
  {
    v2 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(a1, "newRadioMmWaveDataBearer"))
    return CFSTR("FR2");
  return v2;
}

- (const)radioCoverageString
{
  const __CFString *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(a1, "newRadioCoverage"))
      v2 = CFSTR("NR");
    else
      v2 = 0;
  }
  else
  {
    v2 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(a1, "newRadioSaCoverage"))
    v2 = CFSTR("NRSA");
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(a1, "newRadioNsaCoverage"))
    return CFSTR("NRNSA");
  return v2;
}

- (id)dictionary
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "attached"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("cellular_attached"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "roamAllowed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("cellular_roam_allowed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "dataPlanSignalingReductionOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("cellular_data_plan_signaling_reduction_override"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "cellularDataPossible"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("cellular_data_possible"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "inHomeCountry"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("cellular_in_home_country"));

  objc_msgSend(a1, "indicatorString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("cellular_indicator"));

  objc_msgSend(a1, "indicatorOverrideString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("cellular_indicator_override"));

  objc_msgSend(a1, "radioTechnologyString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("cellular_radio_access_technology_ct_data_status"));

  objc_msgSend(a1, "dataBearerTechnologyString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("cellular_data_bearer_technology"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "dataBearerSoMask"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("cellular_data_bearer_so_mask"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "activeContexts"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("cellular_active_contexts"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "totalActiveContexts"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("cellular_total_active_contexts"));

  objc_msgSend(a1, "radioFrequencyString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("cellular_radio_frequency"));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = objc_msgSend(a1, "reason") - 1;
    if (v16 > 0xA)
      v17 = CFSTR("Unknown");
    else
      v17 = off_24C9911E0[v16];
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("cellular_event_change_reason"));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "newRadioCoverage"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v18, CFSTR("cellular_new_radio_coverage"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "newRadioSaCoverage"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("cellular_new_radio_sa_coverage"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "newRadioNsaCoverage"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, CFSTR("cellular_new_radio_nsa_coverage"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "newRadioDataBearer"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, CFSTR("cellular_new_radio_data_bearer"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "newRadioSaDataBearer"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("cellular_new_radio_sa_data_bearer"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "newRadioNsaDataBearer"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, CFSTR("cellular_new_radio_nsa_data_bearer"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "newRadioMmWaveDataBearer"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v24, CFSTR("cellular_new_radio_mmwave_data_bearer"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "newRadioSub6DataBearer"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v25, CFSTR("cellular_new_radio_sub6_data_bearer"));

  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
