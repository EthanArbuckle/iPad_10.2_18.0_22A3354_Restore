@implementation CWFScanResult(Dictionary)

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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "networkName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("wifi_ssid"));

  objc_msgSend(a1, "BSSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("wifi_bssid"));

  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "channel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("wifi_channel"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "RSSI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("wifi_rssi"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "noise"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("wifi_noise"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isInternetAccessible"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("wifi_is_internet_accessible"));

  objc_msgSend(a1, "primaryMAC");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("wifi_primary_mac"));

  objc_msgSend(a1, "scanRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SCAN_BSSID_LIST"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("wifi_scan_bssid_list"));

  objc_msgSend(a1, "scanRecord");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ScaledRSSI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("wifi_scaled_rssi"));

  objc_msgSend(a1, "scanRecord");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SNR"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("wifi_snr"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "strongestSupportedSecurityType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v18, CFSTR("wifi_strongest_supported_security_type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isAppleSWAP"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("wifi_is_apple_swap"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
