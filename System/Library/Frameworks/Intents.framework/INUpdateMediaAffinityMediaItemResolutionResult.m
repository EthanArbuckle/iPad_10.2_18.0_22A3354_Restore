@implementation INUpdateMediaAffinityMediaItemResolutionResult

+ (NSArray)successesWithResolvedMediaItems:(NSArray *)resolvedMediaItems
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___INUpdateMediaAffinityMediaItemResolutionResult;
  objc_msgSendSuper2(&v4, sel_successesWithResolvedMediaItems_, resolvedMediaItems);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (INUpdateMediaAffinityMediaItemResolutionResult)unsupportedForReason:(INUpdateMediaAffinityMediaItemUnsupportedReason)reason
{
  void *v4;

  objc_msgSend(a1, "unsupported");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnsupportedReason:", reason);
  return (INUpdateMediaAffinityMediaItemResolutionResult *)v4;
}

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INUpdateMediaAffinityMediaItemResolutionResult;
  v7 = -[INIntentResolutionResult _initWithIntentSlotResolutionResult:slotDescription:](&v14, sel__initWithIntentSlotResolutionResult_slotDescription_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "payloadUnsupported");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasUpdateMediaAffinityIntentMediaItemsUnsupportedReason");

    if (v9)
    {
      objc_msgSend(v6, "payloadUnsupported");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "updateMediaAffinityIntentMediaItemsUnsupportedReason");
      switch(v11)
      {
        case 1:
          v12 = 1;
          break;
        case 2:
          v12 = 2;
          break;
        case 3:
          v12 = 3;
          break;
        case 4:
          v12 = 4;
          break;
        case 5:
          v12 = 5;
          break;
        case 6:
          v12 = 6;
          break;
        case 7:
          v12 = 7;
          break;
        case 8:
          v12 = 8;
          break;
        default:
          switch(v11)
          {
            case 'd':
              v12 = 1000;
              break;
            case 'e':
              v12 = 1001;
              break;
            case 'f':
              v12 = 1002;
              break;
            case 'g':
              v12 = 1003;
              break;
            default:
              v12 = 0;
              break;
          }
          break;
      }
      objc_msgSend(v7, "setUnsupportedReason:", v12);

    }
  }

  return v7;
}

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)INUpdateMediaAffinityMediaItemResolutionResult;
  -[INIntentResolutionResult _buildIntentSlotResolutionResultWithIntentSlotDescription:](&v10, sel__buildIntentSlotResolutionResultWithIntentSlotDescription_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode") == 1
    && -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason"))
  {
    objc_msgSend(v4, "payloadUnsupported");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReason:", 1000);

    objc_msgSend(v4, "payloadUnsupported");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason");
    switch(v7)
    {
      case 1uLL:
        v8 = 1;
        break;
      case 2uLL:
        v8 = 2;
        break;
      case 3uLL:
        v8 = 3;
        break;
      case 4uLL:
        v8 = 4;
        break;
      case 5uLL:
        v8 = 5;
        break;
      case 6uLL:
        v8 = 6;
        break;
      case 7uLL:
        v8 = 7;
        break;
      case 8uLL:
        v8 = 8;
        break;
      default:
        switch(v7)
        {
          case 0x3E8uLL:
            v8 = 100;
            break;
          case 0x3E9uLL:
            v8 = 101;
            break;
          case 0x3EAuLL:
            v8 = 102;
            break;
          case 0x3EBuLL:
            v8 = 103;
            break;
          default:
            v8 = 0x7FFFFFFFLL;
            break;
        }
        break;
    }
    objc_msgSend(v6, "setUpdateMediaAffinityIntentMediaItemsUnsupportedReason:", v8);

  }
  return v4;
}

@end
