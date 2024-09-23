@implementation WKTouchActionGestureRecognizer

- (WKTouchActionGestureRecognizer)initWithTouchActionDelegate:(id)a3
{
  WKTouchActionGestureRecognizer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKTouchActionGestureRecognizer;
  result = -[WKTouchActionGestureRecognizer init](&v5, sel_init);
  if (result)
    result->_touchActionDelegate = (WKTouchActionGestureRecognizerDelegate *)a3;
  return result;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 34) = 0;
  return self;
}

- (void)setTouchActions:(OptionSet<WebCore:(unsigned int)a4 :TouchAction>)a3 forTouchIdentifier:
{
  uint64_t v4;
  unsigned int v5;
  unsigned __int8 var0;

  var0 = a3.var0;
  v5 = a4;
  WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::inlineSet<unsigned int const&,WTF::OptionSet<WebCore::TouchAction>&>((uint64_t *)&self->_touchActionsByTouchIdentifier, (int *)&v5, &var0, (uint64_t)&v4);
}

- (void)clearTouchActionsForTouchIdentifier:(unsigned int)a3
{
  uint64_t *p_touchActionsByTouchIdentifier;
  _DWORD *v4;
  uint64_t v5;
  unsigned int v6;

  v6 = a3;
  p_touchActionsByTouchIdentifier = (uint64_t *)&self->_touchActionsByTouchIdentifier;
  v4 = (_DWORD *)WTF::HashTable<unsigned int,WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>>,WTF::DefaultHash<unsigned int>,WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned int>>::find<WTF::IdentityHashTranslator<WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned int>>,unsigned int>((uint64_t *)&self->_touchActionsByTouchIdentifier, (int *)&v6);
  if (*p_touchActionsByTouchIdentifier)
  {
    v5 = *p_touchActionsByTouchIdentifier + 8 * *(unsigned int *)(*p_touchActionsByTouchIdentifier - 4);
    if ((_DWORD *)v5 == v4)
      return;
  }
  else
  {
    if (!v4)
      return;
    v5 = 0;
  }
  if ((_DWORD *)v5 != v4)
    WTF::HashTable<unsigned int,WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>>,WTF::DefaultHash<unsigned int>,WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned int>>::remove(p_touchActionsByTouchIdentifier, v4);
}

- (void)_updateState
{
  -[WKTouchActionGestureRecognizer setState:](self, "setState:", 3);
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  uint64_t *p_touchActionsByTouchIdentifier;
  unsigned int *m_tableForLLDB;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_touchActionsByTouchIdentifier = (uint64_t *)&self->_touchActionsByTouchIdentifier;
  m_tableForLLDB = self->_touchActionsByTouchIdentifier.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB
    && *(m_tableForLLDB - 3)
    && ((v7 = -[WKTouchActionGestureRecognizerDelegate gestureRecognizerMayPanWebView:](self->_touchActionDelegate, "gestureRecognizerMayPanWebView:"), v8 = -[WKTouchActionGestureRecognizerDelegate gestureRecognizerMayPinchToZoomWebView:](self->_touchActionDelegate, "gestureRecognizerMayPinchToZoomWebView:", a3), v9 = -[WKTouchActionGestureRecognizerDelegate gestureRecognizerMayDoubleTapToZoomWebView:](self->_touchActionDelegate, "gestureRecognizerMayDoubleTapToZoomWebView:", a3), v10 = v9, v21 = v7, (v7 & 1) != 0)|| (v8 & 1) != 0|| v9))
  {
    v12 = (void *)-[WKTouchActionGestureRecognizerDelegate touchActionActiveTouches](self->_touchActionDelegate, "touchActionActiveTouches");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v22 = objc_msgSend(v16, "unsignedIntegerValue");
          v17 = WTF::HashTable<unsigned int,WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>>,WTF::DefaultHash<unsigned int>,WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned int>>::find<WTF::IdentityHashTranslator<WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned int>>,unsigned int>(p_touchActionsByTouchIdentifier, &v22);
          v18 = v17;
          v19 = *p_touchActionsByTouchIdentifier;
          if (*p_touchActionsByTouchIdentifier)
            v19 += 8 * *(unsigned int *)(v19 - 4);
          if (v19 != v17
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", v16), "gestureRecognizers"), "containsObject:", a3)&& (v21 && (*(_BYTE *)(v18 + 4) & 0x1C) == 0|| v8 && (*(_BYTE *)(v18 + 4) & 0x24) == 0|| v10 && (*(_BYTE *)(v18 + 4) & 2) != 0))
          {
            LOBYTE(v11) = 1;
            return v11;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        LOBYTE(v11) = 0;
        if (v13)
          continue;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (void).cxx_destruct
{
  char *m_table;

  m_table = (char *)self->_touchActionsByTouchIdentifier.m_impl.var0.m_table;
  if (m_table)
    WTF::fastFree((WTF *)(m_table - 16), (void *)a2);
}

@end
