@implementation NSString

void __63__NSString_ECEmailAddressQuoting__ecemailaddress_uniquedDomain__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.emailcore.domain_uniqueStrings", 0);
  v1 = (void *)ecemailaddress_uniquedDomain_uniqueStringsQueue;
  ecemailaddress_uniquedDomain_uniqueStringsQueue = (uint64_t)v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 100);
  v3 = (void *)ecemailaddress_uniquedDomain_uniqueStrings;
  ecemailaddress_uniquedDomain_uniqueStrings = v2;

}

void __75__NSString_ECEmailAddressQuoting__ecemailaddress_trimmedAndQuotedLocalPart__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" ()<>[]:;@\\,\"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ecemailaddress_trimmedAndQuotedLocalPart_specials;
  ecemailaddress_trimmedAndQuotedLocalPart_specials = v0;

}

void __77__NSString_ECEmailAddressQuoting__ecemailaddress_trimmedAndQuotedDisplayName__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("()<>[]:;@\\,.\"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ecemailaddress_trimmedAndQuotedDisplayName_specials;
  ecemailaddress_trimmedAndQuotedDisplayName_specials = v0;

}

void __63__NSString_ECEmailAddressQuoting__ecemailaddress_uniquedDomain__block_invoke_222(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((unint64_t)objc_msgSend((id)ecemailaddress_uniquedDomain_uniqueStrings, "count") >= 0x64)
    objc_msgSend((id)ecemailaddress_uniquedDomain_uniqueStrings, "removeAllObjects");
  objc_msgSend((id)ecemailaddress_uniquedDomain_uniqueStrings, "ef_uniquedObject:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__NSString_ECPersonNameComponents__ec_nameExtensions__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("jr."), CFSTR("sr."), CFSTR("iii"), CFSTR("m.d."), CFSTR("md"), CFSTR("d.d.s."), CFSTR("dds"), CFSTR("ph.d."), CFSTR("phd"), CFSTR("m.b.a."), CFSTR("mba"), CFSTR("esq."), CFSTR("esq"), CFSTR("jr"), CFSTR("sr"), CFSTR("ii"), CFSTR("iv"),
         CFSTR("v"),
         CFSTR("vi"),
         CFSTR("vii"),
         CFSTR("viii"),
         CFSTR("ix"),
         0);
  v1 = (void *)ec_nameExtensions_nameExtensions;
  ec_nameExtensions_nameExtensions = v0;

}

void __54__NSString_ECPersonNameComponents__ec_partialSurnames__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("de"), CFSTR("den"), CFSTR("der"), CFSTR("di"), CFSTR("do"), CFSTR("du"), CFSTR("la"), CFSTR("le"), CFSTR("les"), CFSTR("van"), CFSTR("von"), 0);
  v1 = (void *)ec_partialSurnames_partialSurnames;
  ec_partialSurnames_partialSurnames = v0;

}

@end
