@implementation DMCAnalyticsSendEnrollmentEvent

id __DMCAnalyticsSendEnrollmentEvent_block_invoke(unsigned __int8 *a1)
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
  _QWORD v12[8];
  _QWORD v13[9];

  v13[8] = *MEMORY[0x24BDAC8D0];
  v12[0] = *MEMORY[0x24BE60EA0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1[32]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x24BE60E78];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1[33]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v12[2] = *MEMORY[0x24BE60E98];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1[34]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  v12[3] = *MEMORY[0x24BE60E80];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1[35]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  v12[4] = *MEMORY[0x24BE60EB0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1[36]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  v12[5] = *MEMORY[0x24BE60E70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1[37]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  v12[6] = *MEMORY[0x24BE60E90];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1[38]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v8;
  v12[7] = *MEMORY[0x24BE60E88];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1[39]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
