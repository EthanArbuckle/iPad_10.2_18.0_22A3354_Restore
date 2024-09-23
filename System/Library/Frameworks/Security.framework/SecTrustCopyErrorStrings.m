@implementation SecTrustCopyErrorStrings

_QWORD *__SecTrustCopyErrorStrings_block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = result;
  v2 = result[6];
  v3 = *(_QWORD *)(v2 + 88);
  if (v3)
    result = CFRetain(*(CFTypeRef *)(v2 + 88));
  *(_QWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = v3;
  v4 = v1[6];
  v5 = *(_QWORD *)(v4 + 72);
  if (v5)
    result = CFRetain(*(CFTypeRef *)(v4 + 72));
  *(_QWORD *)(*(_QWORD *)(v1[5] + 8) + 24) = v5;
  return result;
}

void __SecTrustCopyErrorStrings_block_invoke_3(_QWORD *a1, const void *a2)
{
  const __CFArray *v4;
  unint64_t FirstIndexOfValue;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  const __CFString *v10;
  int v11;
  const void *v12;
  uint64_t v13;
  CFRange v14;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFArray *)SecTrustCopyErrorStrings_policyChecks;
  v14.length = CFArrayGetCount((CFArrayRef)SecTrustCopyErrorStrings_policyChecks);
  v14.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v14, a2);
  if (FirstIndexOfValue < 0x4B)
  {
    v7 = FirstIndexOfValue;
    v8 = *(_QWORD *)(a1[4] + 8);
    v9 = *((_DWORD *)&checkmap + 4 * FirstIndexOfValue);
    if (*(_DWORD *)(v8 + 24) > v9)
    {
      *(_DWORD *)(v8 + 24) = v9;
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *((_DWORD *)&checkmap + 4 * FirstIndexOfValue + 1);
    }
    if (!*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
      CFStringAppend(*(CFMutableStringRef *)(*(_QWORD *)(a1[9] + 8) + 24), CFSTR(", "));
    v10 = SecFrameworkCopyLocalizedString(*((const __CFString **)&checkmap + 2 * v7 + 1), CFSTR("Trust"));
    CFStringAppend(*(CFMutableStringRef *)(*(_QWORD *)(a1[9] + 8) + 24), v10);
    if (v10)
      CFRelease(v10);
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
  }
  else
  {
    v6 = secLogObjForScope("SecWarning");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = a2;
      _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "unknown failure key in details dictionary: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

void __SecTrustCopyErrorStrings_block_invoke_2()
{
  __CFArray *Mutable;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  CFArrayAppendValue(Mutable, CFSTR("SSLHostname"));
  CFArrayAppendValue(Mutable, CFSTR("Email"));
  CFArrayAppendValue(Mutable, CFSTR("TemporalValidity"));
  CFArrayAppendValue(Mutable, CFSTR("WeakKeySize"));
  CFArrayAppendValue(Mutable, CFSTR("WeakSignature"));
  CFArrayAppendValue(Mutable, CFSTR("KeyUsage"));
  CFArrayAppendValue(Mutable, CFSTR("ExtendedKeyUsage"));
  CFArrayAppendValue(Mutable, CFSTR("SubjectCommonName"));
  CFArrayAppendValue(Mutable, CFSTR("SubjectCommonNamePrefix"));
  CFArrayAppendValue(Mutable, CFSTR("SubjectCommonNameTEST"));
  CFArrayAppendValue(Mutable, CFSTR("SubjectOrganization"));
  CFArrayAppendValue(Mutable, CFSTR("SubjectOrganizationalUnit"));
  CFArrayAppendValue(Mutable, CFSTR("NotValidBefore"));
  CFArrayAppendValue(Mutable, CFSTR("EAPTrustedServerNames"));
  CFArrayAppendValue(Mutable, CFSTR("LeafMarkerOid"));
  CFArrayAppendValue(Mutable, CFSTR("LeafMarkerOidWithoutValueCheck"));
  CFArrayAppendValue(Mutable, CFSTR("LeafMarkersProdAndQA"));
  CFArrayAppendValue(Mutable, CFSTR("BlackListedLeaf"));
  CFArrayAppendValue(Mutable, CFSTR("GrayListedLeaf"));
  CFArrayAppendValue(Mutable, CFSTR("LeafSPKISHA256"));
  CFArrayAppendValue(Mutable, CFSTR("NotCA"));
  CFArrayAppendValue(Mutable, CFSTR("MarkRepresentation"));
  CFArrayAppendValue(Mutable, CFSTR("IssuerCommonName"));
  CFArrayAppendValue(Mutable, CFSTR("IssuerCommonNamePrefix"));
  CFArrayAppendValue(Mutable, CFSTR("BasicConstraints"));
  CFArrayAppendValue(Mutable, CFSTR("BasicConstraintsCA"));
  CFArrayAppendValue(Mutable, CFSTR("BasicConstraintsPathLen"));
  CFArrayAppendValue(Mutable, CFSTR("IntermediateSPKISHA256"));
  CFArrayAppendValue(Mutable, CFSTR("IntermediateEKU"));
  CFArrayAppendValue(Mutable, CFSTR("IntermediateMarkerOid"));
  CFArrayAppendValue(Mutable, CFSTR("IntermediateMarkerOidWithoutValueCheck"));
  CFArrayAppendValue(Mutable, CFSTR("IntermediateOrganization"));
  CFArrayAppendValue(Mutable, CFSTR("IntermediateCountry"));
  CFArrayAppendValue(Mutable, CFSTR("AnchorSHA256"));
  CFArrayAppendValue(Mutable, CFSTR("AnchorTrusted"));
  CFArrayAppendValue(Mutable, CFSTR("MissingIntermediate"));
  CFArrayAppendValue(Mutable, CFSTR("AnchorApple"));
  CFArrayAppendValue(Mutable, CFSTR("CAspkiSHA256"));
  CFArrayAppendValue(Mutable, CFSTR("NonEmptySubject"));
  CFArrayAppendValue(Mutable, CFSTR("IdLinkage"));
  CFArrayAppendValue(Mutable, CFSTR("KeySize"));
  CFArrayAppendValue(Mutable, CFSTR("SignatureHashAlgorithms"));
  CFArrayAppendValue(Mutable, CFSTR("CertificatePolicy"));
  CFArrayAppendValue(Mutable, CFSTR("ValidRoot"));
  CFArrayAppendValue(Mutable, CFSTR("CriticalExtensions"));
  CFArrayAppendValue(Mutable, CFSTR("ChainLength"));
  CFArrayAppendValue(Mutable, CFSTR("BasicCertificateProcessing"));
  CFArrayAppendValue(Mutable, CFSTR("NameConstraints"));
  CFArrayAppendValue(Mutable, CFSTR("PolicyConstraints"));
  CFArrayAppendValue(Mutable, CFSTR("GrayListedKey"));
  CFArrayAppendValue(Mutable, CFSTR("BlackListedKey"));
  CFArrayAppendValue(Mutable, CFSTR("UsageConstraints"));
  CFArrayAppendValue(Mutable, CFSTR("SystemTrustedWeakHash"));
  CFArrayAppendValue(Mutable, CFSTR("SystemTrustedWeakKey"));
  CFArrayAppendValue(Mutable, CFSTR("PinningRequired"));
  CFArrayAppendValue(Mutable, CFSTR("Revocation"));
  CFArrayAppendValue(Mutable, CFSTR("RevocationResponseRequired"));
  CFArrayAppendValue(Mutable, CFSTR("CTRequired"));
  CFArrayAppendValue(Mutable, CFSTR("SystemTrustedCTRequired"));
  CFArrayAppendValue(Mutable, CFSTR("IssuerPolicyConstraints"));
  CFArrayAppendValue(Mutable, CFSTR("IssuerNameConstraints"));
  CFArrayAppendValue(Mutable, CFSTR("ValidityPeriodMaximums"));
  CFArrayAppendValue(Mutable, CFSTR("SystemTrustValidityPeriod"));
  CFArrayAppendValue(Mutable, CFSTR("OtherTrustValidityPeriod"));
  CFArrayAppendValue(Mutable, CFSTR("ServerAuthEKU"));
  CFArrayAppendValue(Mutable, CFSTR("EmailProtectionEKU"));
  CFArrayAppendValue(Mutable, CFSTR("SinglePurposeChainEKU"));
  CFArrayAppendValue(Mutable, CFSTR("UnparseableExtension"));
  CFArrayAppendValue(Mutable, CFSTR("NonTlsCTRequired"));
  CFArrayAppendValue(Mutable, CFSTR("DuplicateExtension"));
  CFArrayAppendValue(Mutable, CFSTR("NoNetworkAccess"));
  CFArrayAppendValue(Mutable, CFSTR("ExtendedValidation"));
  CFArrayAppendValue(Mutable, CFSTR("RevocationOnline"));
  CFArrayAppendValue(Mutable, CFSTR("RevocationIfTrusted"));
  CFArrayAppendValue(Mutable, CFSTR("RevocationDbIgnored"));
  SecTrustCopyErrorStrings_policyChecks = (uint64_t)Mutable;
}

@end
