@implementation LTSpeakRequest

uint64_t __37___LTSpeakRequest__withHandlerQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53___LTSpeakRequest__startTranslationWithService_done___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53___LTSpeakRequest__startTranslationWithService_done___block_invoke_2;
    v8[3] = &unk_250693E28;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    v9 = v5;
    v10 = v6;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_withHandlerQueue:", v8);

    objc_destroyWeak(&v12);
  }

}

void __53___LTSpeakRequest__startTranslationWithService_done___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setOutputFileURL:", *(_QWORD *)(a1 + 32));
    v3 = v4[17];
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    WeakRetained = v4;
  }

}

void __44___LTSpeakRequest_ttsAudioStarted_duration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, double);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "audioStartHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v5;
    if (v3)
    {
      objc_msgSend(v5, "audioStartHandler");
      v4 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      v4[2](v4, *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

      WeakRetained = v5;
    }
  }

}

@end
