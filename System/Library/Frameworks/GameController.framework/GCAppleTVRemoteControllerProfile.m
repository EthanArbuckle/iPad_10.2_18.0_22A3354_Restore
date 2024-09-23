@implementation GCAppleTVRemoteControllerProfile

void __46___GCAppleTVRemoteControllerProfile_setOwner___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_motion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueChangedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_motion");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueChangedHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_motion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v5);

  }
}

void __46___GCAppleTVRemoteControllerProfile_setOwner___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_motion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "internalValueChangedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_motion");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "internalValueChangedHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_motion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v5);

  }
}

void __55___GCAppleTVRemoteControllerProfile_setAllowsRotation___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "processOrientationData:", v3);

}

@end
