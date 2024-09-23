@implementation WKContentView(WKInteractionPreview)

- (void)continueContextMenuInteraction:
{
  unsigned int *v2;

  v2 = *(unsigned int **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0;
  if (v2)
    WTF::ThreadSafeRefCounted<WebKit::CompletionHandlerCallChecker,(WTF::DestructionThread)0>::deref(v2);
  _Block_release(*(const void **)(a1 + 32));
}

- (uint64_t)continueContextMenuInteraction:
{
  uint64_t result;
  uint64_t v3;

  result = WebKit::CompletionHandlerCallChecker::completionHandlerHasBeenCalled(*(SEL **)(a1 + 40));
  if ((result & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 1;
    return (*(uint64_t (**)(void))(v3 + 16))();
  }
  return result;
}

@end
