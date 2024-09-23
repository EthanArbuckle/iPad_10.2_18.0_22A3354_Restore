@implementation NWURLSessionDelegateWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueueWrapper, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fallbackDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_wrappedDelegate, 0);
}

- (id)initWithFallbackDelegateWrapper:(id *)a1
{
  _QWORD *v4;
  id *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)NWURLSessionDelegateWrapper;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      if (v4)
      {
        v5[4] = (id)v4[4];
        v6 = (void *)v4[5];
      }
      else
      {
        v6 = 0;
        v5[4] = 0;
      }
      objc_storeStrong(v5 + 5, v6);
      if (v4)
        v7 = (void *)v4[6];
      else
        v7 = 0;
      objc_storeStrong(a1 + 6, v7);
      objc_storeStrong(a1 + 3, a2);
    }
  }

  return a1;
}

- (_BYTE)delegateFor_sessionDidBecomeInvalidWithError
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[8] & 1) != 0)
    {
      if ((a1[11] & 0x40) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 64;
      else
        v3 = 0;
      v2[11] = v2[11] & 0xBF | v3;
      v2[8] |= 1u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_sessionDidBecomeInvalidWithError](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_sessionDidReceiveChallenge
{
  _BYTE *v2;
  char v3;
  char v4;

  if (a1)
  {
    v2 = a1;
    if ((a1[8] & 2) != 0)
    {
      if ((a1[11] & 0x80) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_sessionDidReceiveChallenge](*((_QWORD *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 0x80;
      else
        v3 = 0;
      v4 = v3 & 0x80 | v2[11] & 0x7F;
      v2[11] = v4;
      v2[8] |= 2u;
      if ((v4 & 0x80) == 0)
        goto LABEL_4;
    }
    a1 = objc_getProperty(v2, a2, 16, 1);
  }
  return a1;
}

- (_BYTE)delegateFor_didCreateTask
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[8] & 8) != 0)
    {
      if ((a1[12] & 2) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 2;
      else
        v3 = 0;
      v2[12] = v2[12] & 0xFD | v3;
      v2[8] |= 8u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didCreateTask](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_isWaitingForConnectivity
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[8] & 0x20) != 0)
    {
      if ((a1[12] & 8) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 8;
      else
        v3 = 0;
      v2[12] = v2[12] & 0xF7 | v3;
      v2[8] |= 0x20u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_isWaitingForConnectivity](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_willPerformHTTPRedirection
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[8] & 0x40) != 0)
    {
      if ((a1[12] & 0x10) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 16;
      else
        v3 = 0;
      v2[12] = v2[12] & 0xEF | v3;
      v2[8] |= 0x40u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_willPerformHTTPRedirection](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (char)delegateFor_didReceiveChallenge
{
  char *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if (a1[8] < 0)
    {
      if ((a1[12] & 0x20) != 0)
      {
LABEL_4:
        a1 = (char *)objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 32;
      else
        v3 = 0;
      v2[12] = v2[12] & 0xDF | v3;
      v2[8] |= 0x80u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveChallenge](*((_QWORD *)v2 + 3));
    a1 = (char *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_needNewBodyStream
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 1) != 0)
    {
      if ((a1[12] & 0x40) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 64;
      else
        v3 = 0;
      v2[12] = v2[12] & 0xBF | v3;
      v2[9] |= 1u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_needNewBodyStream](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_needNewBodyStreamFromOffset
{
  _BYTE *v2;
  char v3;
  char v4;

  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 2) != 0)
    {
      if ((a1[12] & 0x80) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_needNewBodyStreamFromOffset](*((_QWORD *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 0x80;
      else
        v3 = 0;
      v4 = v3 & 0x80 | v2[12] & 0x7F;
      v2[12] = v4;
      v2[9] |= 2u;
      if ((v4 & 0x80) == 0)
        goto LABEL_4;
    }
    a1 = objc_getProperty(v2, a2, 16, 1);
  }
  return a1;
}

- (_BYTE)delegateFor_didSendBodyData
{
  _BYTE *v2;
  char v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 4) != 0)
    {
      if ((a1[13] & 1) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_didSendBodyData](*((_QWORD *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      v3 = v2[13] & 0xFE | objc_opt_respondsToSelector() & 1;
      v2[13] = v3;
      v2[9] |= 4u;
      if ((v3 & 1) == 0)
        goto LABEL_4;
    }
    a1 = objc_getProperty(v2, a2, 16, 1);
  }
  return a1;
}

- (_BYTE)delegateFor_didFinishCollectingMetrics
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 8) != 0)
    {
      if ((a1[13] & 2) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 2;
      else
        v3 = 0;
      v2[13] = v2[13] & 0xFD | v3;
      v2[9] |= 8u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didFinishCollectingMetrics](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_didCompleteWithError
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 0x10) != 0)
    {
      if ((a1[13] & 4) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 4;
      else
        v3 = 0;
      v2[13] = v2[13] & 0xFB | v3;
      v2[9] |= 0x10u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didCompleteWithError](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor__schemeUpgraded
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 0x20) != 0)
    {
      if ((a1[13] & 8) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 8;
      else
        v3 = 0;
      v2[13] = v2[13] & 0xF7 | v3;
      v2[9] |= 0x20u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor__schemeUpgraded](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_didReceiveInformationalResponse
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[9] & 0x40) != 0)
    {
      if ((a1[13] & 0x10) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 16;
      else
        v3 = 0;
      v2[13] = v2[13] & 0xEF | v3;
      v2[9] |= 0x40u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveInformationalResponse](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (char)delegateFor_didReceiveResponse
{
  char *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if (a1[9] < 0)
    {
      if ((a1[13] & 0x20) != 0)
      {
LABEL_4:
        a1 = (char *)objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 32;
      else
        v3 = 0;
      v2[13] = v2[13] & 0xDF | v3;
      v2[9] |= 0x80u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveResponse](*((_QWORD *)v2 + 3));
    a1 = (char *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_didBecomeDownloadTask
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 1) != 0)
    {
      if ((a1[13] & 0x40) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 64;
      else
        v3 = 0;
      v2[13] = v2[13] & 0xBF | v3;
      v2[10] |= 1u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didBecomeDownloadTask](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_didBecomeStreamTask
{
  _BYTE *v2;
  char v3;
  char v4;

  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 2) != 0)
    {
      if ((a1[13] & 0x80) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_didBecomeStreamTask](*((_QWORD *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 0x80;
      else
        v3 = 0;
      v4 = v3 & 0x80 | v2[13] & 0x7F;
      v2[13] = v4;
      v2[10] |= 2u;
      if ((v4 & 0x80) == 0)
        goto LABEL_4;
    }
    a1 = objc_getProperty(v2, a2, 16, 1);
  }
  return a1;
}

- (_BYTE)delegateFor_didReceiveData_withoutCB
{
  _BYTE *v2;
  char v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 4) != 0)
    {
      if ((a1[14] & 1) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_didReceiveData_withoutCB](*((_QWORD *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      v3 = v2[14] & 0xFE | objc_opt_respondsToSelector() & 1;
      v2[14] = v3;
      v2[10] |= 4u;
      if ((v3 & 1) == 0)
        goto LABEL_4;
    }
    a1 = objc_getProperty(v2, a2, 16, 1);
  }
  return a1;
}

- (_BYTE)delegateFor_didReceiveData_withCB
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 8) != 0)
    {
      if ((a1[14] & 2) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 2;
      else
        v3 = 0;
      v2[14] = v2[14] & 0xFD | v3;
      v2[10] |= 8u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveData_withCB](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_willCacheResponse
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 0x10) != 0)
    {
      if ((a1[14] & 4) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 4;
      else
        v3 = 0;
      v2[14] = v2[14] & 0xFB | v3;
      v2[10] |= 0x10u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_willCacheResponse](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_didFinishDownloadingToURL
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 0x20) != 0)
    {
      if ((a1[14] & 8) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 8;
      else
        v3 = 0;
      v2[14] = v2[14] & 0xF7 | v3;
      v2[10] |= 0x20u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didFinishDownloadingToURL](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_didWriteData
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[10] & 0x40) != 0)
    {
      if ((a1[14] & 0x10) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 16;
      else
        v3 = 0;
      v2[14] = v2[14] & 0xEF | v3;
      v2[10] |= 0x40u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didWriteData](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (char)delegateFor_didResumeAtOffset
{
  char *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if (a1[10] < 0)
    {
      if ((a1[14] & 0x20) != 0)
      {
LABEL_4:
        a1 = (char *)objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 32;
      else
        v3 = 0;
      v2[14] = v2[14] & 0xDF | v3;
      v2[10] |= 0x80u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didResumeAtOffset](*((_QWORD *)v2 + 3));
    a1 = (char *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_readClosed
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[11] & 1) != 0)
    {
      if ((a1[14] & 0x40) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 64;
      else
        v3 = 0;
      v2[14] = v2[14] & 0xBF | v3;
      v2[11] |= 1u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_readClosed](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_writeClosed
{
  _BYTE *v2;
  char v3;
  char v4;

  if (a1)
  {
    v2 = a1;
    if ((a1[11] & 2) != 0)
    {
      if ((a1[14] & 0x80) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_writeClosed](*((_QWORD *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 0x80;
      else
        v3 = 0;
      v4 = v3 & 0x80 | v2[14] & 0x7F;
      v2[14] = v4;
      v2[11] |= 2u;
      if ((v4 & 0x80) == 0)
        goto LABEL_4;
    }
    a1 = objc_getProperty(v2, a2, 16, 1);
  }
  return a1;
}

- (_BYTE)delegateFor_betterRouteDiscovered
{
  _BYTE *v2;
  char v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[11] & 4) != 0)
    {
      if ((a1[15] & 1) == 0)
      {
LABEL_4:
        -[NWURLSessionDelegateWrapper delegateFor_betterRouteDiscovered](*((_QWORD *)v2 + 3));
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      v3 = v2[15] & 0xFE | objc_opt_respondsToSelector() & 1;
      v2[15] = v3;
      v2[11] |= 4u;
      if ((v3 & 1) == 0)
        goto LABEL_4;
    }
    a1 = objc_getProperty(v2, a2, 16, 1);
  }
  return a1;
}

- (_BYTE)delegateFor_didOpenWithProtocol
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[11] & 0x10) != 0)
    {
      if ((a1[15] & 4) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 4;
      else
        v3 = 0;
      v2[15] = v2[15] & 0xFB | v3;
      v2[11] |= 0x10u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didOpenWithProtocol](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)delegateFor_didCloseWithCode
{
  _BYTE *v2;
  int v3;

  if (a1)
  {
    v2 = a1;
    if ((a1[11] & 0x20) != 0)
    {
      if ((a1[15] & 8) != 0)
      {
LABEL_4:
        a1 = objc_getProperty(v2, a2, 16, 1);
        return a1;
      }
    }
    else
    {
      objc_getProperty(a1, a2, 16, 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = 8;
      else
        v3 = 0;
      v2[15] = v2[15] & 0xF7 | v3;
      v2[11] |= 0x20u;
      if (v3)
        goto LABEL_4;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didCloseWithCode](*((_QWORD *)v2 + 3));
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)runDelegateBlock:(uint64_t)a1
{
  if (a1)
    -[NWURLSessionDelegateQueue runDelegateBlock:](*(_QWORD **)(a1 + 48), a2);
}

- (void)runCompletionHandler:(int)a3 noAsync:(void *)a4 task:(void *)a5 metrics:(void *)a6 cachedResponse:(void *)a7 cache:
{
  void (**v13)(_QWORD);
  _QWORD *v14;
  id v15;
  id v16;
  const char *v17;
  id v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void (**v36)(_QWORD);

  v13 = a2;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v18 = a7;
  if (a1)
  {
    -[NWURLSessionDelegateWrapper delegateFor_willCacheResponse]((_BYTE *)a1, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[NWURLSessionDelegateWrapper delegateFor_didFinishCollectingMetrics]((_BYTE *)a1, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a3)
        goto LABEL_12;
    }
    else
    {
      v21 = 0;
      if (!a3)
        goto LABEL_12;
    }
    if (!v20 && !v21)
    {
      v13[2](v13);
      if (v14)
      {
        v23 = (void *)v14[29];
        if (v23)
          objc_setProperty_atomic(v23, v22, 0, 16);
        v24 = (void *)v14[30];
        v14[30] = 0;

      }
      goto LABEL_13;
    }
LABEL_12:
    v25 = *(id *)(a1 + 32);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __94__NWURLSessionDelegateWrapper_runCompletionHandler_noAsync_task_metrics_cachedResponse_cache___block_invoke;
    v28[3] = &unk_1E14AAA78;
    v28[4] = a1;
    v29 = v16;
    v30 = v18;
    v31 = v14;
    v32 = v20;
    v33 = v21;
    v34 = v25;
    v35 = v15;
    v36 = v13;
    v26 = *(_QWORD **)(a1 + 48);
    v27 = v25;
    -[NWURLSessionDelegateQueue runDelegateBlock:](v26, v28);

LABEL_13:
  }

}

void __94__NWURLSessionDelegateWrapper_runCompletionHandler_noAsync_task_metrics_cachedResponse_cache___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  -[NWURLSessionDelegateWrapper saveCachedResponseOnDelegateQueue:cache:dataTask:delegateForCache:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 72), "URLSession:task:didFinishCollectingMetrics:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88));
  (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    v4 = *(void **)(v3 + 232);
    if (v4)
      objc_setProperty_atomic(v4, v2, 0, 16);
    v5 = *(void **)(v3 + 240);
    *(_QWORD *)(v3 + 240) = 0;

  }
}

- (void)saveCachedResponseOnDelegateQueue:(void *)a3 cache:(void *)a4 dataTask:(void *)a5 delegateForCache:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NWURLSessionDelegateDeallocBomb *v14;
  id v15;
  NWURLSessionDelegateDeallocBomb *v16;
  uint64_t v17;
  NWURLSessionDelegateDeallocBomb *v18;
  _QWORD v19[4];
  NWURLSessionDelegateDeallocBomb *v20;
  uint64_t v21;
  id v22;
  id v23;
  objc_super v24;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a1 && v9)
  {
    if (v12)
    {
      v14 = [NWURLSessionDelegateDeallocBomb alloc];
      v15 = v13;
      if (v14)
      {
        v24.receiver = v14;
        v24.super_class = (Class)NWURLSessionDelegateDeallocBomb;
        v16 = (NWURLSessionDelegateDeallocBomb *)objc_msgSendSuper2(&v24, sel_init);
        v14 = v16;
        if (v16)
        {
          objc_storeStrong((id *)&v16->__object, a5);
          v14->__method = sel_URLSession_dataTask_willCacheResponse_completionHandler_;
        }
      }

      v17 = *(_QWORD *)(a1 + 32);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __97__NWURLSessionDelegateWrapper_saveCachedResponseOnDelegateQueue_cache_dataTask_delegateForCache___block_invoke;
      v19[3] = &unk_1E14AAAC8;
      v20 = v14;
      v21 = a1;
      v22 = v10;
      v23 = v11;
      v18 = v14;
      objc_msgSend(v15, "URLSession:dataTask:willCacheResponse:completionHandler:", v17, v23, v9, v19);

    }
    else
    {
      objc_msgSend(v10, "storeCachedResponse:forDataTask:", v9, v11);
    }
  }

}

void __97__NWURLSessionDelegateWrapper_saveCachedResponseOnDelegateQueue_cache_dataTask_delegateForCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(_QWORD *)(a1 + 32));
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __97__NWURLSessionDelegateWrapper_saveCachedResponseOnDelegateQueue_cache_dataTask_delegateForCache___block_invoke_2;
    v6[3] = &unk_1E14AAAA0;
    v4 = *(_QWORD *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v8 = v3;
    v5 = *(id *)(a1 + 56);
    v9 = v5;
    if (v4)
    {
      -[NWURLSessionDelegateQueue runDelegateBlock:](*(_QWORD **)(v4 + 48), v6);
      v5 = v9;
    }

  }
}

uint64_t __97__NWURLSessionDelegateWrapper_saveCachedResponseOnDelegateQueue_cache_dataTask_delegateForCache___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "storeCachedResponse:forDataTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __57__NWURLSessionDelegateWrapper_didBecomeInvalidWithError___block_invoke(uint64_t a1)
{
  const char *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "URLSession:didBecomeInvalidWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = *(void **)(a1 + 56);
  if (v3)
    objc_setProperty_atomic(v3, v2, 0, 16);
}

uint64_t __60__NWURLSessionDelegateWrapper_taskIsWaitingForConnectivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:taskIsWaitingForConnectivity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)task:(void *)a3 willPerformHTTPRedirection:(void *)a4 newRequest:(void *)a5 completionHandler:
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NWURLSessionDelegateDeallocBomb *v17;
  id v18;
  NWURLSessionDelegateDeallocBomb *v19;
  _QWORD *v20;
  id v21;
  NWURLSessionDelegateDeallocBomb *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NWURLSessionDelegateDeallocBomb *v30;
  id v31;
  id v32;
  objc_super v33;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v13 = a5;
  if (a1)
  {
    -[NWURLSessionDelegateWrapper delegateFor_willPerformHTTPRedirection]((_BYTE *)a1, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = *(id *)(a1 + 32);
      v16 = *(id *)(a1 + 40);
      v17 = [NWURLSessionDelegateDeallocBomb alloc];
      v18 = v14;
      if (v17)
      {
        v33.receiver = v17;
        v33.super_class = (Class)NWURLSessionDelegateDeallocBomb;
        v19 = (NWURLSessionDelegateDeallocBomb *)objc_msgSendSuper2(&v33, sel_init);
        v17 = v19;
        if (v19)
        {
          objc_storeStrong((id *)&v19->__object, v14);
          v17->__method = sel_task_willPerformHTTPRedirection_newRequest_completionHandler_;
        }
      }

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
      v24[3] = &unk_1E14AAB68;
      v25 = v18;
      v26 = v15;
      v27 = v9;
      v28 = v10;
      v29 = v11;
      v30 = v17;
      v31 = v16;
      v32 = v13;
      v20 = *(_QWORD **)(a1 + 48);
      v21 = v16;
      v22 = v17;
      v23 = v15;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v20, v24);

    }
    else
    {
      (*((void (**)(id, id))v13 + 2))(v13, v11);
    }

  }
}

void __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
  v7[3] = &unk_1E14AAB40;
  v6 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  v10 = *(id *)(a1 + 88);
  objc_msgSend(v2, "URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:", v3, v4, v5, v6, v7);

}

void __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3;
  v7[3] = &unk_1E14ACE18;
  v4 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __92__NWURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)task:(void *)a3 didReceiveChallenge:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  NWURLSessionDelegateDeallocBomb *v17;
  id v18;
  NWURLSessionDelegateDeallocBomb *v19;
  _QWORD *v20;
  id v21;
  NWURLSessionDelegateDeallocBomb *v22;
  id v23;
  id v24;
  int v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  NWURLSessionDelegateDeallocBomb *v30;
  id v31;
  NWURLSessionDelegateDeallocBomb *v32;
  _QWORD *v33;
  id v34;
  NWURLSessionDelegateDeallocBomb *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  NWURLSessionDelegateDeallocBomb *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  NWURLSessionDelegateDeallocBomb *v49;
  id v50;
  id v51;
  objc_super v52;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(v8, "protectionSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "authenticationMethod");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C92B70]) & 1) != 0
      || (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C92B30]) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C92B60]))
    {

    }
    else
    {
      v25 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C92B58]);

      if (!v25)
        goto LABEL_12;
    }
    -[NWURLSessionDelegateWrapper delegateFor_sessionDidReceiveChallenge]((_BYTE *)a1, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = *(id *)(a1 + 32);
      v16 = *(id *)(a1 + 40);
      v17 = [NWURLSessionDelegateDeallocBomb alloc];
      v18 = v14;
      if (v17)
      {
        v52.receiver = v17;
        v52.super_class = (Class)NWURLSessionDelegateDeallocBomb;
        v19 = (NWURLSessionDelegateDeallocBomb *)objc_msgSendSuper2(&v52, sel_init);
        v17 = v19;
        if (v19)
        {
          objc_storeStrong((id *)&v19->__object, v14);
          v17->__method = sel_task_didReceiveChallenge_completionHandler_;
        }
      }

      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke;
      v45[3] = &unk_1E14AABB8;
      v46 = v18;
      v47 = v15;
      v48 = v8;
      v49 = v17;
      v50 = v16;
      v51 = v9;
      v20 = *(_QWORD **)(a1 + 48);
      v21 = v16;
      v22 = v17;
      v23 = v15;
      v24 = v18;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v20, v45);

LABEL_18:
      goto LABEL_19;
    }
LABEL_12:
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveChallenge]((char *)a1, v12);
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = (void *)v26;
      v28 = *(id *)(a1 + 32);
      v29 = *(id *)(a1 + 40);
      v30 = [NWURLSessionDelegateDeallocBomb alloc];
      v31 = v27;
      if (v30)
      {
        v52.receiver = v30;
        v52.super_class = (Class)NWURLSessionDelegateDeallocBomb;
        v32 = (NWURLSessionDelegateDeallocBomb *)objc_msgSendSuper2(&v52, sel_init);
        v30 = v32;
        if (v32)
        {
          objc_storeStrong((id *)&v32->__object, v27);
          v30->__method = sel_task_didReceiveChallenge_completionHandler_;
        }
      }

      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_4;
      v37[3] = &unk_1E14AAB18;
      v24 = v31;
      v38 = v24;
      v39 = v28;
      v40 = v7;
      v41 = v8;
      v42 = v30;
      v43 = v29;
      v44 = v9;
      v33 = *(_QWORD **)(a1 + 48);
      v34 = v29;
      v35 = v30;
      v36 = v28;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v33, v37);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
      v24 = 0;
    }
    goto LABEL_18;
  }
LABEL_19:

}

void __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_2;
  v5[3] = &unk_1E14AAB90;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  objc_msgSend(v2, "URLSession:didReceiveChallenge:completionHandler:", v3, v4, v5);

}

void __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_5;
  v6[3] = &unk_1E14AAB90;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:task:didReceiveChallenge:completionHandler:", v3, v4, v5, v6);

}

void __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  -[NWURLSessionDelegateDeallocBomb disarm](*(_QWORD *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_6;
  block[3] = &unk_1E14AAAF0;
  v6 = *(NSObject **)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_6(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  -[NWURLSessionDelegateDeallocBomb disarm](*(_QWORD *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_3;
  block[3] = &unk_1E14AAAF0;
  v6 = *(NSObject **)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __74__NWURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 80);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14AABE0;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v2, "URLSession:task:needNewBodyStreamFromOffset:completionHandler:", v3, v5, v4, v6);

}

void __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_5;
  v5[3] = &unk_1E14AABE0;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  objc_msgSend(v2, "URLSession:task:needNewBodyStream:", v3, v4, v5);

}

void __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_6;
  v7[3] = &unk_1E14ACE18;
  v4 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_3;
  v7[3] = &unk_1E14ACE18;
  v4 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __110__NWURLSessionDelegateWrapper_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), *(dispatch_block_t *)(a1 + 64));
}

- (void)task:(void *)a3 didCompleteWithError:(void *)a4 metrics:
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v11 = v9;
  if (a1)
  {
    if (v9)
    {
      -[NWURLSessionDelegateWrapper delegateFor_didFinishCollectingMetrics]((_BYTE *)a1, v10);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    -[NWURLSessionDelegateWrapper delegateFor_didCompleteWithError]((_BYTE *)a1, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12 | v13)
    {
      v14 = *(id *)(a1 + 32);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __65__NWURLSessionDelegateWrapper_task_didCompleteWithError_metrics___block_invoke;
      v17[3] = &unk_1E14AAC58;
      v18 = (id)v12;
      v19 = v14;
      v20 = v7;
      v21 = v11;
      v22 = (id)v13;
      v23 = v8;
      v15 = *(_QWORD **)(a1 + 48);
      v16 = v14;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v15, v17);

    }
  }

}

void __65__NWURLSessionDelegateWrapper_task_didCompleteWithError_metrics___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "URLSession:task:didFinishCollectingMetrics:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "URLSession:task:didCompleteWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = *(void **)(v3 + 232);
    if (v4)
      objc_setProperty_atomic(v4, v2, 0, 16);
    v5 = *(void **)(v3 + 240);
    *(_QWORD *)(v3 + 240) = 0;

  }
}

void __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14AAB40;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:task:_schemeUpgraded:completionHandler:", v3, v4, v5, v6);

}

void __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  -[NWURLSessionDelegateDeallocBomb disarm](*(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_3;
  v7[3] = &unk_1E14ACE18;
  v4 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)task:(void *)a3 didReceiveInformationalResponse:
{
  id v5;
  const char *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v7 = a3;
  if (a1)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveInformationalResponse]((_BYTE *)a1, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(id *)(a1 + 32);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __68__NWURLSessionDelegateWrapper_task_didReceiveInformationalResponse___block_invoke;
      v12[3] = &unk_1E14AB4D8;
      v13 = v8;
      v14 = v9;
      v15 = v5;
      v16 = v7;
      v10 = *(_QWORD **)(a1 + 48);
      v11 = v9;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v10, v12);

    }
  }

}

uint64_t __68__NWURLSessionDelegateWrapper_task_didReceiveInformationalResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:task:didReceiveInformationalResponse:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
  v6[3] = &unk_1E14AAC80;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "URLSession:dataTask:didReceiveResponse:completionHandler:", v3, v4, v5, v6);

}

void __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  -[NWURLSessionDelegateDeallocBomb disarm](*(_QWORD *)(a1 + 32));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_3;
  v5[3] = &unk_1E14AB060;
  v4 = *(NSObject **)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)dataTask:(void *)a3 didBecomeDownloadTask:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  void (**v10)(_QWORD);
  void *v11;
  id v12;
  id v13;
  _QWORD *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD);

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didBecomeDownloadTask]((_BYTE *)a1, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = *(id *)(a1 + 32);
      v13 = *(id *)(a1 + 40);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __80__NWURLSessionDelegateWrapper_dataTask_didBecomeDownloadTask_completionHandler___block_invoke;
      v17[3] = &unk_1E14AABB8;
      v18 = v11;
      v19 = v12;
      v20 = v7;
      v21 = v8;
      v22 = v13;
      v23 = v10;
      v14 = *(_QWORD **)(a1 + 48);
      v15 = v13;
      v16 = v12;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v14, v17);

    }
    else
    {
      v10[2](v10);
    }

  }
}

void __80__NWURLSessionDelegateWrapper_dataTask_didBecomeDownloadTask_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:dataTask:didBecomeDownloadTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  dispatch_async(*(dispatch_queue_t *)(a1 + 64), *(dispatch_block_t *)(a1 + 72));
}

- (void)dataTask:(void *)a3 didBecomeStreamTask:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  const char *v9;
  void (**v10)(_QWORD);
  void *v11;
  id v12;
  id v13;
  _QWORD *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD);

  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (a1)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didBecomeStreamTask]((_BYTE *)a1, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = *(id *)(a1 + 32);
      v13 = *(id *)(a1 + 40);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __78__NWURLSessionDelegateWrapper_dataTask_didBecomeStreamTask_completionHandler___block_invoke;
      v17[3] = &unk_1E14AABB8;
      v18 = v11;
      v19 = v12;
      v20 = v7;
      v21 = v8;
      v22 = v13;
      v23 = v10;
      v14 = *(_QWORD **)(a1 + 48);
      v15 = v13;
      v16 = v12;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v14, v17);

    }
    else
    {
      v10[2](v10);
    }

  }
}

void __78__NWURLSessionDelegateWrapper_dataTask_didBecomeStreamTask_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:dataTask:didBecomeStreamTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  dispatch_async(*(dispatch_queue_t *)(a1 + 64), *(dispatch_block_t *)(a1 + 72));
}

void __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_2;
    v14[3] = &unk_1E14ACE18;
    v5 = &v15;
    v6 = *(_QWORD *)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    v16 = *(id *)(a1 + 144);
    objc_msgSend(v2, "URLSession:dataTask:_didReceiveData:completionHandler:", v3, v4, v6, v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 72), "URLSession:dataTask:didReceiveData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v7 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_4;
    block[3] = &unk_1E14AC390;
    v5 = &v13;
    v13 = *(id *)(a1 + 144);
    dispatch_async(v7, block);
  }

  if (*(_BYTE *)(a1 + 152))
  {
    -[NWURLSessionDelegateWrapper saveCachedResponseOnDelegateQueue:cache:dataTask:delegateForCache:](*(_QWORD *)(a1 + 80), *(void **)(a1 + 88), *(void **)(a1 + 96), *(void **)(a1 + 48), *(void **)(a1 + 104));
    objc_msgSend(*(id *)(a1 + 112), "URLSession:task:didFinishCollectingMetrics:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 120));
    objc_msgSend(*(id *)(a1 + 128), "URLSession:task:didCompleteWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 136));
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      v10 = *(void **)(v9 + 232);
      if (v10)
        objc_setProperty_atomic(v10, v8, 0, 16);
      v11 = *(void **)(v9 + 240);
      *(_QWORD *)(v9 + 240) = 0;

    }
  }
}

void __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_3;
  block[3] = &unk_1E14AC390;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__NWURLSessionDelegateWrapper_downloadTask_didFinishDownloadingToURL_error_metrics_completionHandler___block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "URLSession:downloadTask:didFinishDownloadingToURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "URLSession:task:didFinishCollectingMetrics:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 80), "URLSession:task:didCompleteWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = *(void **)(v3 + 232);
    if (v4)
      objc_setProperty_atomic(v4, v2, 0, 16);
    v5 = *(void **)(v3 + 240);
    *(_QWORD *)(v3 + 240) = 0;

  }
  dispatch_async(*(dispatch_queue_t *)(a1 + 96), *(dispatch_block_t *)(a1 + 104));
}

void __119__NWURLSessionDelegateWrapper_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), *(dispatch_block_t *)(a1 + 64));
}

- (void)downloadTask:(uint64_t)a3 didResumeAtOffset:(uint64_t)a4 expectedTotalBytes:
{
  const char *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v8 = a2;
  if (a1)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didResumeAtOffset]((char *)a1, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = *(id *)(a1 + 32);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __81__NWURLSessionDelegateWrapper_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke;
      v13[3] = &unk_1E14AACF8;
      v14 = v9;
      v15 = v10;
      v16 = v8;
      v17 = a3;
      v18 = a4;
      v11 = *(_QWORD **)(a1 + 48);
      v12 = v10;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v11, v13);

    }
  }

}

uint64_t __81__NWURLSessionDelegateWrapper_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:downloadTask:didResumeAtOffset:expectedTotalBytes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)readClosedForStreamTask:(uint64_t)a1
{
  const char *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v4 = a2;
  if (a1)
  {
    -[NWURLSessionDelegateWrapper delegateFor_readClosed]((_BYTE *)a1, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *(id *)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __55__NWURLSessionDelegateWrapper_readClosedForStreamTask___block_invoke;
      v9[3] = &unk_1E14AAAA0;
      v10 = v5;
      v11 = v6;
      v12 = v4;
      v7 = *(_QWORD **)(a1 + 48);
      v8 = v6;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v7, v9);

    }
  }

}

uint64_t __55__NWURLSessionDelegateWrapper_readClosedForStreamTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:readClosedForStreamTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __56__NWURLSessionDelegateWrapper_writeClosedForStreamTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:writeClosedForStreamTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __66__NWURLSessionDelegateWrapper_betterRouteDiscoveredForStreamTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:betterRouteDiscoveredForStreamTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __65__NWURLSessionDelegateWrapper_webSocketTask_didOpenWithProtocol___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:webSocketTask:didOpenWithProtocol:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __69__NWURLSessionDelegateWrapper_webSocketTask_didCloseWithCode_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:webSocketTask:didCloseWithCode:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

@end
