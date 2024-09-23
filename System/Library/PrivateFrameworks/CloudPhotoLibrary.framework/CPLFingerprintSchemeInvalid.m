@implementation CPLFingerprintSchemeInvalid

- (id)_invalidFingerprintForSelector:(SEL)a3 withError:(id *)a4
{
  void *v8;
  int v9;
  NSObject *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (_invalidFingerprintForSelector_withError__onceToken != -1)
    dispatch_once(&_invalidFingerprintForSelector_withError__onceToken, &__block_literal_global_130);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("CPLCrashOnInvalidFingerprintScheme"));

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 392, CFSTR("Trying to user %@ with an invalid fingerprint scheme"), v15);

    abort();
  }
  __CPLGenericOSLogDomain();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    NSStringFromSelector(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_fault_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_FAULT, "Trying to use %{public}@ with an invalid fingerprint scheme", buf, 0xCu);

  }
  if (a4)
    *a4 = objc_retainAutorelease((id)_invalidFingerprintForSelector_withError__invalidError);
  return 0;
}

- (id)fingerPrintForFD:(int)a3 error:(id *)a4
{
  return -[CPLFingerprintSchemeInvalid _invalidFingerprintForSelector:withError:](self, "_invalidFingerprintForSelector:withError:", a2, a4);
}

- (id)fingerPrintForData:(id)a3 error:(id *)a4
{
  return -[CPLFingerprintSchemeInvalid _invalidFingerprintForSelector:withError:](self, "_invalidFingerprintForSelector:withError:", a2, a4);
}

- (id)fingerPrintForFileAtURL:(id)a3 error:(id *)a4
{
  return -[CPLFingerprintSchemeInvalid _invalidFingerprintForSelector:withError:](self, "_invalidFingerprintForSelector:withError:", a2, a4);
}

- (id)zeroByteFileFingerprint
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 413, CFSTR("%@ should not be used on %@"), v6, objc_opt_class());

  abort();
}

- (BOOL)isMMCSv2
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 417, CFSTR("%@ should not be used on %@"), v6, objc_opt_class());

  abort();
}

- (BOOL)isValid
{
  return 0;
}

- (id)fingerprintSchemeDescription
{
  return CFSTR("Invalid");
}

void __72__CPLFingerprintSchemeInvalid__invalidFingerprintForSelector_withError___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 100, CFSTR("Invalid fingerprint scheme (likely cause: missing master identifier)"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_invalidFingerprintForSelector_withError__invalidError;
  _invalidFingerprintForSelector_withError__invalidError = v0;

}

@end
