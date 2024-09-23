@implementation NSMutableSet(ECEmailAddressConvertible)

+ (id)ec_emailAddressConvertiblesSetFromArray:()ECEmailAddressConvertible includeInvalid:
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  char v11;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__NSMutableSet_ECEmailAddressConvertible__ec_emailAddressConvertiblesSetFromArray_includeInvalid___block_invoke;
  v9[3] = &unk_1E7120F60;
  v7 = v6;
  v10 = v7;
  v11 = a4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

@end
