@implementation SecCoreAnalyticsSendKernEntropyHealthAnalytics

id __SecCoreAnalyticsSendKernEntropyHealthAnalytics_block_invoke(unsigned int *a1)
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

  v13[8] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("uptime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1[8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = CFSTR("startup_done");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1[9]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v12[2] = CFSTR("adaptive_proportion_failure_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1[10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  v12[3] = CFSTR("adaptive_proportion_max_observation_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1[11]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  v12[4] = CFSTR("adaptive_proportion_reset_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1[12]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  v12[5] = CFSTR("repetition_failure_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1[13]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  v12[6] = CFSTR("repetition_max_observation_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1[14]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v8;
  v12[7] = CFSTR("repetition_reset_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1[15]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
