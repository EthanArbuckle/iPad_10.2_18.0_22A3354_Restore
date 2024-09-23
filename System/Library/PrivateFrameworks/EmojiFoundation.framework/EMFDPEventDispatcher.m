@implementation EMFDPEventDispatcher

- (EMFDPEventDispatcher)init
{
  return -[EMFDPEventDispatcher initWithReportingDelegate:](self, "initWithReportingDelegate:", 0);
}

- (EMFDPEventDispatcher)initWithReportingDelegate:(id)a3
{
  id v5;
  EMFDPEventDispatcher *v6;
  EMFDPEventDispatcher *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *reportingBackgroundQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMFDPEventDispatcher;
  v6 = -[EMFDPEventDispatcher init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reportingDelegate, a3);
    v8 = dispatch_queue_create("com.apple.EmojiFoundation.DifferentialPrivacyRecording", 0);
    reportingBackgroundQueue = v7->_reportingBackgroundQueue;
    v7->_reportingBackgroundQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9
{
  uint64_t v9;

  LOBYTE(v9) = a9;
  -[EMFDPEventDispatcher didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:completionHandler:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:completionHandler:", a3, a4, a5, a6, a7, a8, v9, 0);
}

- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9 completionHandler:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  __CFError *v19;
  __CFError *v20;
  CFTypeRef v21;
  BOOL v22;
  CFTypeID v23;
  CFIndex i;
  CFIndex Count;
  const __CFString *ValueAtIndex;
  CFTypeID v27;
  EMFBiomeEmojiUsageRecorder *v28;
  EMFBiomeEmojiUsageRecorder *v29;
  NSObject *reportingBackgroundQueue;
  EMFBiomeEmojiUsageRecorder *v31;
  uint64_t v32;
  EMFDPEventDispatcher *v33;
  id v35;
  id v36;
  _QWORD block[4];
  EMFBiomeEmojiUsageRecorder *v38;
  id v39;
  id v40;
  CFTypeRef v41;
  CFErrorRef error[2];

  v15 = a3;
  v36 = a5;
  v35 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a10;
  v19 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v20 = v19;
  error[1] = v19;
  if (!v19)
    goto LABEL_20;
  error[0] = 0;
  v21 = SecTaskCopyValueForEntitlement(v19, CFSTR("com.apple.private.biome.read-write"), error);
  v41 = v21;
  v33 = self;
  if (error[0])
  {
    CFRelease(error[0]);
    v22 = 0;
  }
  else
  {
    if (!v21)
    {
      v22 = 0;
      goto LABEL_16;
    }
    v23 = CFGetTypeID(v21);
    if (v23 != CFArrayGetTypeID() || CFArrayGetCount((CFArrayRef)v21) < 1)
    {
      v22 = 0;
      goto LABEL_15;
    }
    for (i = 0; ; ++i)
    {
      Count = CFArrayGetCount((CFArrayRef)v21);
      v22 = i < Count;
      if (i >= Count)
        break;
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v21, i);
      v27 = CFGetTypeID(ValueAtIndex);
      if (v27 == CFStringGetTypeID()
        && CFStringCompare(ValueAtIndex, CFSTR("Emoji.Engagement"), 0) == kCFCompareEqualTo)
      {
        break;
      }
    }
  }
  if (v21)
LABEL_15:
    CFRelease(v21);
LABEL_16:
  CFRelease(v20);
  if (v22)
  {
    LOBYTE(v32) = a9;
    v28 = -[EMFBiomeEmojiUsageRecorder initWithEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:]([EMFBiomeEmojiUsageRecorder alloc], "initWithEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", v15, a4, v36, v35, v16, v17, v32);
    v29 = v28;
    if (v33->_reportingDelegate)
      -[EMFDPRecorder setDelegate:](v28, "setDelegate:");
    reportingBackgroundQueue = v33->_reportingBackgroundQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __157__EMFDPEventDispatcher_didUseEmoji_usageSource_replacementContext_searchQuery_resultPosition_numberSearchQueriesRun_wasPositiveEngagement_completionHandler___block_invoke;
    block[3] = &unk_1E66F9CD0;
    v38 = v29;
    v40 = v18;
    v39 = v15;
    v31 = v29;
    dispatch_async(reportingBackgroundQueue, block);

  }
LABEL_20:

}

uint64_t __157__EMFDPEventDispatcher_didUseEmoji_usageSource_replacementContext_searchQuery_resultPosition_numberSearchQueriesRun_wasPositiveEngagement_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "report");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  -[EMFDPEventDispatcher didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:completionHandler:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:completionHandler:", a3, a4, 0, 0, 0, 0, v5, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_reportingDelegate, 0);
}

@end
