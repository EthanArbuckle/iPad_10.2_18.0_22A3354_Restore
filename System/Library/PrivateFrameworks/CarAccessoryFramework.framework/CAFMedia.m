@implementation CAFMedia

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFMedia;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256824858))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFMedia;
  -[CAFAccessory registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256824858))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFMedia;
  -[CAFAccessory unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (NSArray)mediaSourceServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[CAFAccessory car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x0000000014000006"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x0000000014000006"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return (NSArray *)v9;
}

+ (id)accessoryIdentifier
{
  return CFSTR("0x0000000003000001");
}

+ (id)observerProtocol
{
  return &unk_25682CD30;
}

- (void)tuneToMediaItem:(id)a3 inSource:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  CAFGeneralLogging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CAFMedia(Utilties) tuneToMediaItem:inSource:completion:].cold.1((uint64_t)v8, (uint64_t)v9, v11);

  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFMedia tuneToMediaItemIdentifier:inSourceWithIdentifier:completion:](self, "tuneToMediaItemIdentifier:inSourceWithIdentifier:completion:", v12, v13, v10);

}

- (void)tuneToFrequency:(unsigned int)a3 inSourceWithIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD block[4];
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v6 = *(_QWORD *)&a3;
  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  CAFGeneralLogging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v45 = v11;
    v46 = 2112;
    v47 = v8;
    _os_log_impl(&dword_237717000, v10, OS_LOG_TYPE_DEFAULT, "Tuning to frequency %@ in source %@", buf, 0x16u);

  }
  -[CAFAccessory car](self, "car");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mediaSourceWithIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__CAFMedia_Utilties__tuneToFrequency_inSourceWithIdentifier_completion___block_invoke;
    block[3] = &unk_2508FD320;
    v43 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v16 = v43;
    goto LABEL_15;
  }
  -[CAFAccessory car](self, "car");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nowPlayingInformation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "nowPlaying");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    CAFGeneralLogging();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CAFMedia(Utilties) tuneToFrequency:inSourceWithIdentifier:completion:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __72__CAFMedia_Utilties__tuneToFrequency_inSourceWithIdentifier_completion___block_invoke_15;
    v40[3] = &unk_2508FD320;
    v41 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v40);
    v29 = v41;
    goto LABEL_14;
  }
  objc_msgSend(v13, "currentFrequencyRange");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "valueRoundedToNearestStepValue:", v6);

  objc_msgSend(v13, "currentFrequencyRange");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "valueIsInRange:", v18);

  if ((v20 & 1) == 0)
  {
    CAFGeneralLogging();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[CAFMedia(Utilties) tuneToFrequency:inSourceWithIdentifier:completion:].cold.2(v30, v31, v32, v33, v34, v35, v36, v37);

    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __72__CAFMedia_Utilties__tuneToFrequency_inSourceWithIdentifier_completion___block_invoke_16;
    v38[3] = &unk_2508FD320;
    v39 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v38);
    v29 = v39;
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v16, "tuneToFrequency:sourceIdentifier:completion:", v18, v8, v9);
LABEL_15:

}

void __72__CAFMedia_Utilties__tuneToFrequency_inSourceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CAFErrorDomain, -1, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __72__CAFMedia_Utilties__tuneToFrequency_inSourceWithIdentifier_completion___block_invoke_15(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CAFErrorDomain, -1, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __72__CAFMedia_Utilties__tuneToFrequency_inSourceWithIdentifier_completion___block_invoke_16(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CAFErrorDomain, -1, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)tuneToMediaItemIdentifier:(id)a3 inSourceWithIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[4];
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CAFGeneralLogging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_237717000, v11, OS_LOG_TYPE_DEFAULT, "Tuning to media item identifier %@ in source %@", buf, 0x16u);
  }

  -[CAFAccessory car](self, "car");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nowPlayingInformation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nowPlaying");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "tuneToIdentifier:sourceIdentifier:completion:", v8, v9, v10);
  }
  else
  {
    CAFGeneralLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CAFMedia(Utilties) tuneToFrequency:inSourceWithIdentifier:completion:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__CAFMedia_Utilties__tuneToMediaItemIdentifier_inSourceWithIdentifier_completion___block_invoke;
    block[3] = &unk_2508FD320;
    v24 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __82__CAFMedia_Utilties__tuneToMediaItemIdentifier_inSourceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CAFErrorDomain, -1, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)tuneToMediaItem:(id)a3 inSource:(id)a4 multicastIndex:(int64_t)a5 completion:(id)a6
{
  -[CAFMedia tuneToMediaItem:inSource:completion:](self, "tuneToMediaItem:inSource:completion:", a3, a4, a6);
}

- (void)tuneToFrequency:(unsigned int)a3 inSourceWithIdentifier:(id)a4 multicastIndex:(int64_t)a5 completion:(id)a6
{
  -[CAFMedia tuneToFrequency:inSourceWithIdentifier:completion:](self, "tuneToFrequency:inSourceWithIdentifier:completion:", *(_QWORD *)&a3, a4, a6);
}

- (void)tuneToMediaItemIdentifier:(id)a3 inSourceWithIdentifier:(id)a4 multicastIndex:(int64_t)a5 completion:(id)a6
{
  -[CAFMedia tuneToMediaItemIdentifier:inSourceWithIdentifier:completion:](self, "tuneToMediaItemIdentifier:inSourceWithIdentifier:completion:", a3, a4, a6);
}

@end
