@implementation AXHapticFeedbackManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AXHapticFeedbackManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_SharedManager;
}

void __40__AXHapticFeedbackManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_SharedManager;
  sharedManager_SharedManager = (uint64_t)v1;

}

- (void)playHapticFeedbackForType:(int64_t)a3
{
  if (AXHomeClickHapticsSupported())
    AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __53__AXHapticFeedbackManager_playHapticFeedbackForType___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;

  switch(*(_QWORD *)(result + 40))
  {
    case 0:
    case 0xCLL:
      v1 = *(void **)(result + 32);
      v2 = 3;
      goto LABEL_3;
    case 1:
    case 0x12:
      v1 = *(void **)(result + 32);
      v2 = 1;
      goto LABEL_3;
    case 2:
      return objc_msgSend(*(id *)(result + 32), "_playFeedbackImpactBehaviorWithIntensity:", 1.0);
    case 3:
      v1 = *(void **)(result + 32);
      v2 = 6;
      goto LABEL_3;
    case 4:
      v3 = *(void **)(result + 32);
      v4 = 0.005;
      v5 = 7;
      v6 = 4;
      goto LABEL_10;
    case 5:
    case 8:
      v1 = *(void **)(result + 32);
      v2 = 8;
      goto LABEL_3;
    case 6:
      v1 = *(void **)(result + 32);
      v2 = 5;
      goto LABEL_3;
    case 7:
      v3 = *(void **)(result + 32);
      v4 = 0.1;
      v5 = 5;
      goto LABEL_17;
    case 9:
      v3 = *(void **)(result + 32);
      v4 = 0.1;
      v5 = 7;
      goto LABEL_17;
    case 0xALL:
      v3 = *(void **)(result + 32);
      v4 = 0.1;
      v5 = 7;
      goto LABEL_20;
    case 0xBLL:
      return objc_msgSend(*(id *)(result + 32), "_playCancelPatternFeedback");
    case 0xDLL:
      v3 = *(void **)(result + 32);
      v4 = 0.1;
      v5 = 6;
LABEL_17:
      v6 = 2;
      goto LABEL_10;
    case 0xELL:
      v1 = *(void **)(result + 32);
      v2 = 9;
      goto LABEL_3;
    case 0xFLL:
    case 0x13:
      v1 = *(void **)(result + 32);
      v2 = 7;
      goto LABEL_3;
    case 0x10:
      v3 = *(void **)(result + 32);
      v4 = 0.1;
      v5 = 4;
LABEL_20:
      v6 = 3;
      goto LABEL_10;
    case 0x11:
      v3 = *(void **)(result + 32);
      v4 = 0.1;
      v5 = 6;
      v6 = 1;
LABEL_10:
      result = objc_msgSend(v3, "_playPatternFeedback:numberOfRepetitions:atInterval:", v5, v6, v4);
      break;
    case 0x14:
      v1 = *(void **)(result + 32);
      v2 = 0;
LABEL_3:
      result = objc_msgSend(v1, "_playDiscreteFeedbackForType:", v2);
      break;
    default:
      return result;
  }
  return result;
}

- (void)_playFeedback:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(v3, "setHapticOutputMode:", objc_msgSend(v3, "hapticOutputMode") | 5);
  objc_msgSend(MEMORY[0x1E0DC4158], "engineForFeedback:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__AXHapticFeedbackManager__playFeedback___block_invoke;
  v6[3] = &unk_1E76ABC88;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "runWhenReady:", v6);

}

uint64_t __41__AXHapticFeedbackManager__playFeedback___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "play");
  return result;
}

- (void)_playFeedbackImpactBehaviorWithIntensity:(double)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_alloc(MEMORY[0x1E0DC3898]);
  objc_msgSend(MEMORY[0x1E0DC4208], "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "initWithConfiguration:view:", v5, 0);

  objc_msgSend(v6, "activateWithCompletionBlock:", 0);
  objc_msgSend(v6, "impactOccurredWithIntensity:atLocation:", a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  objc_msgSend(v6, "deactivate");

}

- (void)_playDiscreteFeedbackForType:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0DC4100], "discreteFeedbackForType:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHapticFeedbackManager _playFeedback:](self, "_playFeedback:", v4);

}

- (void)_playPatternFeedback:(int64_t)a3 numberOfRepetitions:(int64_t)a4 atInterval:(double)a5
{
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0DC4160], "feedbackPattern");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (a4 >= 1)
  {
    v9 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0DC4100], "discreteFeedbackForType:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addFeedback:atTime:", v10, (double)(int)v9 * a5);

      ++v9;
    }
    while (a4 != v9);
  }
  -[AXHapticFeedbackManager _playFeedback:](self, "_playFeedback:", v11);

}

- (void)_playCancelPatternFeedback
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_tapticEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actuateFeedback:", 2);

}

@end
