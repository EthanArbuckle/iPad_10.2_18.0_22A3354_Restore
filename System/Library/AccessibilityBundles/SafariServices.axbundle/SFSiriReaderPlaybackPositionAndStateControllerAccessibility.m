@implementation SFSiriReaderPlaybackPositionAndStateControllerAccessibility

id __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke(uint64_t a1)
{
  __CFString *v1;

  if (objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("_isPlaying")))
    v1 = CFSTR("reader.pause");
  else
    v1 = CFSTR("reader.play");
  accessibilitySafariServicesLocalizedString(v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilitySafariServicesLocalizedString(CFSTR("skip.backward"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_3;
  v12[3] = &unk_25032D5A0;
  v12[4] = *(_QWORD *)(a1 + 32);
  v6 = (void *)objc_msgSend(v3, "initWithName:actionHandler:", v4, v12);

  objc_msgSend(v2, "addObject:", v6);
  v7 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilitySafariServicesLocalizedString(CFSTR("skip.forward"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_5;
  v11[3] = &unk_25032D5A0;
  v11[4] = *(_QWORD *)(a1 + 32);
  v9 = (void *)objc_msgSend(v7, "initWithName:actionHandler:", v8, v11);

  objc_msgSend(v2, "addObject:", v9);
  return v2;
}

uint64_t __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_3()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decrementValue:", 0);
}

uint64_t __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_5()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __79___SFSiriReaderPlaybackPositionAndStateControllerAccessibility_prepareStepper___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "incrementValue:", 0);
}

@end
