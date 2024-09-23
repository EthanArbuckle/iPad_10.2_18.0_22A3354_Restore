@implementation PKPaymentLocalPassCredential(NanoPassKit)

- (void)_initWithPassTypeIdentifier:()NanoPassKit serialNumber:credentialType:sanitizedPrimaryAccountNumber:longDescription:cardType:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  objc_super v21;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v21.receiver = a1;
  v21.super_class = (Class)&off_254D56478;
  v18 = objc_msgSendSuper2(&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "setPassTypeIdentifier:", v14);
    objc_msgSend(v19, "setSerialNumber:", v15);
    objc_msgSend(v19, "setCredentialType:", a5);
    objc_msgSend(v19, "setSanitizedPrimaryAccountNumber:", v16);
    objc_msgSend(v19, "setLongDescription:", v17);
    objc_msgSend(v19, "setCardType:", a8);
  }

  return v19;
}

@end
