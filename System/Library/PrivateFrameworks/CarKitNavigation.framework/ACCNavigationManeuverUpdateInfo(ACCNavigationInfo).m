@implementation ACCNavigationManeuverUpdateInfo(ACCNavigationInfo)

- (id)cr_dictionary
{
  void *v2;
  unsigned __int16 v3;
  unsigned int v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  v3 = 0;
  do
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(a1, "copyInfo:", v3);
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, v6);

    }
    ++v3;
  }
  while (v4 < 0xD);
  return v2;
}

@end
