@implementation NSError(FCErrorAdditions)

- (uint64_t)fc_hasErrorCode:()FCErrorAdditions
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("FCErrorDomain")))
  {
    v6 = objc_msgSend(a1, "code");

    if (v6 == a3)
      return 1;
  }
  else
  {

  }
  objc_msgSend(a1, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v7 = objc_msgSend(v9, "fc_hasErrorCode:", a3);
  else
    v7 = 0;

  return v7;
}

+ (id)fc_errorWithCode:()FCErrorAdditions description:additionalUserInfo:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  if (v8)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setObject:forKey:", v7, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)fc_errorWithCode:()FCErrorAdditions description:
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", a3, a4, 0);
}

+ (uint64_t)fc_notCachedError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 5, CFSTR("The operation could not be completed with just the contents of the cache."), MEMORY[0x1E0C9AA70]);
}

+ (uint64_t)fc_belowMinimumVersionError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 6, CFSTR("Below minimum version to make modifications."), MEMORY[0x1E0C9AA70]);
}

+ (uint64_t)fc_feedDroppedError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 7, CFSTR("A feed request was dropped by CloudKit."), MEMORY[0x1E0C9AA70]);
}

+ (id)fc_requestDroppedErrorForDroppedFeeds:()FCErrorAdditions totalFeeds:
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rejecting feed request because %lu of %lu feeds were dropped."), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("FCErrorRetryAfter");
  v10[0] = &unk_1E470D590;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 2, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)fc_notAvailableError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 8, CFSTR("The requested data is not available."), MEMORY[0x1E0C9AA70]);
}

+ (uint64_t)fc_canaryDownError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 11, CFSTR("The canary in the coal mine is missing."), MEMORY[0x1E0C9AA70]);
}

+ (id)fc_offlineErrorWithReason:()FCErrorAdditions
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("FCErrorOfflineReasonKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 10, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)fc_missingAppConfigErrorWithUnderlyingError:()FCErrorAdditions
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3
    && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v3, "isEqual:", v4),
        v4,
        (v5 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Failed to load the configuration."), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 14, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)fc_missingResourceErrorWithDescription:()FCErrorAdditions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 19, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)fc_operationCancelledErrorWithAdditionalUserInfo:()FCErrorAdditions
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 1, CFSTR("The operation was cancelled."), a3);
}

+ (id)fc_blockedInCurrentStorefrontErrorWithIdentifiers:()FCErrorAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("FCErrorBlockedContentIdentifiersKey");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 20, CFSTR("The requested content is not allowed in the current storefront"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)fc_partialFailureErrorWithUserInfo:()FCErrorAdditions
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 21, CFSTR("Some of the child operations failed."), a3);
}

+ (uint64_t)fc_missingBridgedGroupError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 22, CFSTR("A bridged group could not be restored from the persisted viewport."), MEMORY[0x1E0C9AA70]);
}

+ (uint64_t)fc_invalidBookmarkErrorWithUserInfo:()FCErrorAdditions
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 23, CFSTR("The bookmark does not correspond to any of the underlying elements."), a3);
}

+ (uint64_t)fc_invalidGapErrorWithUserInfo:()FCErrorAdditions
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 24, CFSTR("The gap does not correspond to any of the underlying elements."), a3);
}

+ (id)fc_missingAssetErrorWithAssetHandles:()FCErrorAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_133);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_66_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0CB2F70];
  v11[0] = CFSTR("FCErrorMissingObjectsDescriptionsKey");
  v11[1] = v7;
  v12[0] = v5;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 25, CFSTR("The requested asset could not be retrieved."), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fc_unzipFailedErrorWithErrorCode:()FCErrorAdditions
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("FCErrorUnderlyingErrorCodeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 26, CFSTR("Failed to unzip a zip archive."), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)fc_unauthorizedAssetKeyErrorWithWrappingKeyID:()FCErrorAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCErrorAssetWrappingKeyIDKey"));

  objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 27, CFSTR("The requested asset wrapping key could not be retrieved because the user isn't authorized."), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fc_unauthorizedAVAssetKeyErrorWithKeyURI:()FCErrorAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCErrorAssetKeyURI"));

  objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 35, CFSTR("The requested AV asset key could not be retrieved because the user isn't authorized."), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)fc_unauthorizedAVAssetCertificateError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 34, CFSTR("The AV asset key certificate could not be retrieved because the user isn't authorized."), MEMORY[0x1E0C9AA70]);
}

+ (uint64_t)fc_expiredAVAssetCertificateError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 38, CFSTR("The AV asset key certificate is expired."), MEMORY[0x1E0C9AA70]);
}

+ (uint64_t)fc_invalidAVAssetKeyURIError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 36, CFSTR("The AV asset key URI is invalid."), MEMORY[0x1E0C9AA70]);
}

+ (uint64_t)fc_missingAssetKeyError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 28, CFSTR("The requested asset wrapping key could not be retrieved."), 0);
}

+ (id)fc_missingANFDocumentErrorForArticleID:()FCErrorAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCErrorArticleIDKey"));

  objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 29, CFSTR("An ANF article is missing its main document asset handle."), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fc_invalidChannelErrorForTagID:()FCErrorAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCErrorTagIDKey"));

  objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 30, CFSTR("The operation could not be completed because the expected channel was invalid."), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fc_invalidSectionErrorForTagID:()FCErrorAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FCErrorTagIDKey"));

  objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 31, CFSTR("The operation could not be completed because the expected section was invalid."), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)fc_authUserAccountInvalid
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 32, CFSTR("User account is invalid or nonexistent and cannot be authenticated."), MEMORY[0x1E0C9AA70]);
}

+ (uint64_t)fc_emptyM3UPlaylistError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:", 33, CFSTR("M3U playlist has no streams."));
}

+ (uint64_t)fc_secureSubscriptionsDisallowedError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:", 39, CFSTR("Subscriptions may not be stored in the secure private database."));
}

+ (uint64_t)fc_encryptionRequiredError
{
  return objc_msgSend(a1, "fc_errorWithCode:description:", 40, CFSTR("This operation may not run unless encryption is enabled."));
}

+ (id)fc_HTTPErrorWithURL:()FCErrorAdditions statusCode:requestUUID:additionalUserInfo:
{
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a6;
  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fc_safelySetObjectAllowingNil:forKey:", v12, CFSTR("FCErrorHTTPURL"));

  objc_msgSend(v13, "fc_safelySetObjectAllowingNil:forKey:", v11, CFSTR("FCErrorHTTPRequestUUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fc_safelySetObjectAllowingNil:forKey:", v14, CFSTR("FCErrorHTTPStatusCode"));

  if (v9)
    objc_msgSend(v13, "addEntriesFromDictionary:", v9);
  v15 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("URL download failed with status code %lu"), a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fc_errorWithCode:description:additionalUserInfo:", 4, v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (uint64_t)fc_exceededQueryBudgetErrorWithAdditionalUserInfo:()FCErrorAdditions
{
  return objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 43, CFSTR("The operation reached its maximum number of allowed queries."), a3);
}

+ (id)fc_unknownRecordZoneErrorWithZoneName:()FCErrorAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown record zone %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fc_errorWithCode:description:additionalUserInfo:", 16, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
