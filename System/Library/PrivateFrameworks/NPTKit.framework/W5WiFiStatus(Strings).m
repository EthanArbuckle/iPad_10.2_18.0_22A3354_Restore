@implementation W5WiFiStatus(Strings)

- (id)powerString
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "power");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length") == 24)
  {
    objc_msgSend(a1, "power");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "bytes");
    W5DescriptionForPower();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    W5DescriptionForPower();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)desenseString
{
  id v1;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a1, "desense");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  if (v4 == 16)
  {
    objc_msgSend(a1, "desense");
    v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v1, "bytes");
  }
  objc_msgSend(a1, "desenseLevel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") == 8)
  {
    objc_msgSend(a1, "desenseLevel");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "bytes");
    W5DescriptionForDesense();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    W5DescriptionForDesense();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v4 == 16)
  return v7;
}

- (id)chainAckString
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "chainAck");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length") == 24)
  {
    objc_msgSend(a1, "chainAck");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "bytes");
    W5DescriptionForChainAck();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    W5DescriptionForChainAck();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
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

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "macAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "macAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("wifi_mac_address"));

  }
  objc_msgSend(a1, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "ssidString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v6, CFSTR("wifi_ssid"));

  }
  objc_msgSend(a1, "bssid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "bssid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v8, CFSTR("wifi_bssid"));

  }
  objc_msgSend(a1, "security");
  W5DescriptionForSecurity();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v9, CFSTR("wifi_security"));

  objc_msgSend(a1, "channel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "channel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "channel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v13, CFSTR("wifi_channel"));

  }
  objc_msgSend(a1, "countryCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(a1, "countryCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v15, CFSTR("wifi_country_code"));

  }
  objc_msgSend(a1, "chainAckString");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(a1, "chainAckString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      objc_msgSend(a1, "chainAckString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setValue:forKey:", v20, CFSTR("wifi_chain_ack"));

    }
  }
  objc_msgSend(a1, "desenseString");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    objc_msgSend(a1, "desenseString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length");

    if (v24)
    {
      objc_msgSend(a1, "desenseString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setValue:forKey:", v25, CFSTR("wifi_desense"));

    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "rssi"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v26, CFSTR("wifi_rssi"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "noise"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v27, CFSTR("wifi_noise"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "numberOfSpacialStreams"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v28, CFSTR("wifi_number_of_spatial_streams"));

  objc_msgSend(a1, "eapolControlMode");
  W5DescriptionForEAPOLControlMode();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v29, CFSTR("wifi_eapol_control_mode"));

  objc_msgSend(a1, "eapolSupplicantState");
  W5DescriptionForEAPOLSupplicantState();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v30, CFSTR("wifi_eapol_supplicant_state"));

  objc_msgSend(a1, "opMode");
  W5DescriptionForOpMode();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v31, CFSTR("wifi_op_mode"));

  objc_msgSend(a1, "phyMode");
  W5DescriptionForPHYMode();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v32, CFSTR("wifi_phy_mode"));

  objc_msgSend(a1, "btcMode");
  W5DescriptionForBTCMode();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v33, CFSTR("wifi_btc_mode"));

  v34 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "txRate");
  objc_msgSend(v34, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v35, CFSTR("wifi_tx_rate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "mcsIndex"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v36, CFSTR("wifi_mcs_index"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "guardInterval"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v37, CFSTR("wifi_guard_interval"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

@end
