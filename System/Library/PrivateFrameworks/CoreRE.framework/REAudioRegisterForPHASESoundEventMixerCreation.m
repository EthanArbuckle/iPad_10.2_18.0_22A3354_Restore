@implementation REAudioRegisterForPHASESoundEventMixerCreation

void __REAudioRegisterForPHASESoundEventMixerCreation_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id *v9;
  id WeakRetained;
  id v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v9);

  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained(v9);
    objc_msgSend(v11, "phaseEngine:didCreatePhaseSoundEventWithMixer:mixGroupName:", v12, v7, v8);

  }
}

@end
