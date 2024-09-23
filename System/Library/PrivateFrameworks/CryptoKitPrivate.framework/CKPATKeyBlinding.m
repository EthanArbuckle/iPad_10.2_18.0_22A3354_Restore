@implementation CKPATKeyBlinding

+ (id)privateScalarFromSecKey:(__SecKey *)a3
{
  return +[CKPIETFKeyBlinding privateScalarFromSecKey:](_TtC16CryptoKitPrivate18CKPIETFKeyBlinding, "privateScalarFromSecKey:", a3);
}

+ (__SecKey)secKeyFromCompressedRepresentation:(id)a3
{
  __SecKey *v3;

  v3 = +[CKPIETFKeyBlinding secKeyFromCompressedRepresentation:](_TtC16CryptoKitPrivate18CKPIETFKeyBlinding, "secKeyFromCompressedRepresentation:", a3);
  CFRetain(v3);
  return v3;
}

+ (id)compressedRepresentationFromSecKey:(__SecKey *)a3
{
  return +[CKPIETFKeyBlinding compressedRepresentationFromSecKey:](_TtC16CryptoKitPrivate18CKPIETFKeyBlinding, "compressedRepresentationFromSecKey:", a3);
}

+ (BOOL)isValidSignature:(id)a3 forMessage:(id)a4 signedBy:(__SecKey *)a5 context:(id)a6
{
  return +[CKPIETFKeyBlinding isValidWithSignature:for:with:context:](_TtC16CryptoKitPrivate18CKPIETFKeyBlinding, "isValidWithSignature:for:with:context:", a3, a4, a5, a6);
}

+ (id)blindSignMessage:(id)a3 blindedBy:(__SecKey *)a4 withKey:(__SecKey *)a5 context:(id)a6 error:(id *)a7
{
  return +[CKPIETFKeyBlinding blindSign:blindedBy:with:context:error:](_TtC16CryptoKitPrivate18CKPIETFKeyBlinding, "blindSign:blindedBy:with:context:error:", a3, a4, a5, a6, a7);
}

+ (__SecKey)blindPublicKey:(__SecKey *)a3 withPrivateKey:(__SecKey *)a4 context:(id)a5 error:(id *)a6
{
  __SecKey *v6;

  v6 = +[CKPIETFKeyBlinding blindPublicKeyWithPublicKey:with:context:error:](_TtC16CryptoKitPrivate18CKPIETFKeyBlinding, "blindPublicKeyWithPublicKey:with:context:error:", a3, a4, a5, a6);
  CFRetain(v6);
  return v6;
}

+ (__SecKey)unblindPublicKey:(__SecKey *)a3 withPrivateKey:(__SecKey *)a4 context:(id)a5 error:(id *)a6
{
  __SecKey *v6;

  v6 = +[CKPIETFKeyBlinding unblindPublicKey:with:context:error:](_TtC16CryptoKitPrivate18CKPIETFKeyBlinding, "unblindPublicKey:with:context:error:", a3, a4, a5, a6);
  CFRetain(v6);
  return v6;
}

@end
