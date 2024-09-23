@implementation HMTelevisionProfile(HFAdditions)

- (id)hf_mediaSourceComparator
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mediaSourceDisplayOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = a1;
    _os_log_debug_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEBUG, "No media source display order for television profile: %@", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HMTelevisionProfile_HFAdditions__hf_mediaSourceComparator__block_invoke;
  aBlock[3] = &unk_1EA731B50;
  v8 = v2;
  v4 = v2;
  v5 = _Block_copy(aBlock);

  return v5;
}

- (uint64_t)hf_offersAutomation
{
  return 1;
}

@end
