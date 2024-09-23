@implementation SecGetAppleTrustAnchors

void __SecGetAppleTrustAnchors_block_invoke(uint64_t a1)
{
  const __CFArray *Mutable;

  Mutable = CFArrayCreateMutable(0, 3, MEMORY[0x1E0C9B378]);
  addCertificate(Mutable, &AppleRootCA, 1215);
  addCertificate(Mutable, &AppleRootG2, 1430);
  addCertificate(Mutable, &AppleRootG3, 583);
  if ((os_variant_allows_internal_security_policies() & 1) != 0 || *(_BYTE *)(a1 + 32))
  {
    addCertificate(Mutable, &TestAppleRootCA, 1232);
    addCertificate(Mutable, &TestAppleRootG2, 630);
    addCertificate(Mutable, &TestAppleRootG3, 592);
  }
  SecGetAppleTrustAnchors_anchors = (uint64_t)Mutable;
}

@end
