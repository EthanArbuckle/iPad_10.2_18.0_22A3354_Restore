@implementation DICVolumeController

- (id)volumeForCategory:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  double v9;
  void *v10;
  int v12;

  v5 = (void *)MEMORY[0x24BE64988];
  v6 = a3;
  objc_msgSend(v5, "sharedAVSystemController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "getVolume:forCategory:", &v12, v6);

  if (v8)
  {
    LODWORD(v9) = v12;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    if (a4)
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.dropincore.volumecontroller"), 1, 0);
  }

  return v10;
}

- (BOOL)setVolumeForCategory:(id)a3 volume:(float)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  double v10;
  char v11;

  v7 = (void *)MEMORY[0x24BE64988];
  v8 = a3;
  objc_msgSend(v7, "sharedAVSystemController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  v11 = objc_msgSend(v9, "setVolumeTo:forCategory:", v8, v10);

  if (a5 && (v11 & 1) == 0)
    *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.dropincore.volumecontroller"), 2, 0);

  return v11;
}

- (id)volumeForPhoneCallWithError:(id *)a3
{
  return -[DICVolumeController volumeForCategory:error:](self, "volumeForCategory:error:", CFSTR("PhoneCall"), a3);
}

- (BOOL)setVolumeForPhoneCall:(float)a3 error:(id *)a4
{
  return -[DICVolumeController setVolumeForCategory:volume:error:](self, "setVolumeForCategory:volume:error:", CFSTR("PhoneCall"), a4);
}

@end
