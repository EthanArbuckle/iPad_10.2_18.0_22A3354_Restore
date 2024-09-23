@implementation W5NetworkStatus(Strings)

- (BOOL)isAppleReachableBool
{
  return (objc_msgSend(a1, "isAppleReachable") & 2) != 0 && (objc_msgSend(a1, "isAppleReachable") & 4) == 0;
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

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isAppleReachableBool"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("network_is_apple_reachable"));

  objc_msgSend(a1, "primaryIPv4InterfaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("network_primary_ipv4_interface_name"));

  objc_msgSend(a1, "primaryIPv4ServiceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("network_primary_ipv4_service_name"));

  objc_msgSend(a1, "primaryIPv6InterfaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("network_primary_ipv6_interface_name"));

  objc_msgSend(a1, "primaryIPv6ServiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("network_primary_ipv6_service_name"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
