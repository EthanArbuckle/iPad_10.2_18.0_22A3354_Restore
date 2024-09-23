@implementation WKNSURLAuthenticationChallengeSender

- (void)cancelAuthenticationChallenge:(id)a3
{
  uint64_t v4;
  WTF::StringImpl *v5;
  uint64_t v6;
  CFTypeRef v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  CFTypeRef cf;

  checkChallenge((NSURLAuthenticationChallenge *)a3);
  v4 = *(_QWORD *)(objc_msgSend(a3, "_web_authenticationChallengeProxy") + 464);
  WebCore::CredentialBase::CredentialBase((WebCore::CredentialBase *)&v10);
  cf = 0;
  v6 = *(_QWORD *)(v4 + 16);
  if (v6)
  {
    *(_QWORD *)(v4 + 16) = 0;
    (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **))(*(_QWORD *)v6 + 16))(v6, 2, &v10);
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    v7 = cf;
    cf = 0;
    if (v7)
      CFRelease(v7);
  }
  v8 = v11;
  v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v5);
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v10;
  v10 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v5);
    else
      *(_DWORD *)v9 -= 2;
  }
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
  uint64_t v4;
  WTF::StringImpl *v5;
  uint64_t v6;
  CFTypeRef v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  CFTypeRef cf;

  checkChallenge((NSURLAuthenticationChallenge *)a3);
  v4 = *(_QWORD *)(objc_msgSend(a3, "_web_authenticationChallengeProxy") + 464);
  WebCore::CredentialBase::CredentialBase((WebCore::CredentialBase *)&v10);
  cf = 0;
  v6 = *(_QWORD *)(v4 + 16);
  if (v6)
  {
    *(_QWORD *)(v4 + 16) = 0;
    (*(void (**)(uint64_t, _QWORD, WTF::StringImpl **))(*(_QWORD *)v6 + 16))(v6, 0, &v10);
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    v7 = cf;
    cf = 0;
    if (v7)
      CFRelease(v7);
  }
  v8 = v11;
  v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v5);
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v10;
  v10 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v5);
    else
      *(_DWORD *)v9 -= 2;
  }
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
  uint64_t v6;
  WTF::StringImpl *v7;
  uint64_t v8;
  CFTypeRef v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  CFTypeRef cf;

  checkChallenge((NSURLAuthenticationChallenge *)a4);
  v6 = *(_QWORD *)(objc_msgSend(a4, "_web_authenticationChallengeProxy") + 464);
  MEMORY[0x19AEAC4CC](&v12, a3);
  v8 = *(_QWORD *)(v6 + 16);
  if (v8)
  {
    *(_QWORD *)(v6 + 16) = 0;
    (*(void (**)(uint64_t, _QWORD, WTF::StringImpl **))(*(_QWORD *)v8 + 16))(v8, 0, &v12);
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  }
  v9 = cf;
  cf = 0;
  if (v9)
    CFRelease(v9);
  v10 = v13;
  v13 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v7);
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v12;
  v12 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v7);
    else
      *(_DWORD *)v11 -= 2;
  }
}

- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3
{
  uint64_t v4;
  WTF::StringImpl *v5;
  uint64_t v6;
  CFTypeRef v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  CFTypeRef cf;

  checkChallenge((NSURLAuthenticationChallenge *)a3);
  v4 = *(_QWORD *)(objc_msgSend(a3, "_web_authenticationChallengeProxy") + 464);
  WebCore::CredentialBase::CredentialBase((WebCore::CredentialBase *)&v10);
  cf = 0;
  v6 = *(_QWORD *)(v4 + 16);
  if (v6)
  {
    *(_QWORD *)(v4 + 16) = 0;
    (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **))(*(_QWORD *)v6 + 16))(v6, 1, &v10);
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    v7 = cf;
    cf = 0;
    if (v7)
      CFRelease(v7);
  }
  v8 = v11;
  v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v5);
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v10;
  v10 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v5);
    else
      *(_DWORD *)v9 -= 2;
  }
}

- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3
{
  uint64_t v4;
  WTF::StringImpl *v5;
  uint64_t v6;
  CFTypeRef v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  CFTypeRef cf;

  checkChallenge((NSURLAuthenticationChallenge *)a3);
  v4 = *(_QWORD *)(objc_msgSend(a3, "_web_authenticationChallengeProxy") + 464);
  WebCore::CredentialBase::CredentialBase((WebCore::CredentialBase *)&v10);
  cf = 0;
  v6 = *(_QWORD *)(v4 + 16);
  if (v6)
  {
    *(_QWORD *)(v4 + 16) = 0;
    (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **))(*(_QWORD *)v6 + 16))(v6, 3, &v10);
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    v7 = cf;
    cf = 0;
    if (v7)
      CFRelease(v7);
  }
  v8 = v11;
  v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v5);
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v10;
  v10 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v5);
    else
      *(_DWORD *)v9 -= 2;
  }
}

@end
