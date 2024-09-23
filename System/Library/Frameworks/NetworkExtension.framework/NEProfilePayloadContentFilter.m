@implementation NEProfilePayloadContentFilter

- (id)validatePayload
{
  NSObject *v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ne_log_large_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[NEProfilePayloadBase payloadAtom](self, "payloadAtom");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "To-Do: NEProfilePayloadContentFilter validatePayload: dict %@", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

@end
