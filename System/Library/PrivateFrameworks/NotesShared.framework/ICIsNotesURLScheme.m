@implementation ICIsNotesURLScheme

void __ICIsNotesURLScheme_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", CFSTR("applenotes"), CFSTR("mobilenotes"), CFSTR("notes"), 0);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)ICIsNotesURLScheme_validSchemes;
  ICIsNotesURLScheme_validSchemes = v0;

}

@end
