@implementation NSData(VNPersonsModelAdditions)

- (_QWORD)VNPersonsModelSubdataWithRange:()VNPersonsModelAdditions rangeDescriptionProvidingBlock:error:
{
  void (**v10)(_QWORD);
  unint64_t v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = objc_msgSend(a1, "length");
  if (a3 >= v11 || a4 > v11 || a3 + a4 > v11)
  {
    if (a6)
    {
      v10[2](v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ is corrupt"), v12);
      VNPersonsModelErrorForInvalidModelData(v13);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      a6 = 0;
    }
  }
  else
  {
    objc_msgSend(a1, "subdataWithRange:", a3, a4);
    a6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }

  return a6;
}

- (id)VNPersonsModelSubdataWithRange:()VNPersonsModelAdditions rangeDescription:error:
{
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__NSData_VNPersonsModelAdditions__VNPersonsModelSubdataWithRange_rangeDescription_error___block_invoke;
  v14[3] = &unk_1E4548D28;
  v15 = v10;
  v11 = v10;
  objc_msgSend(a1, "VNPersonsModelSubdataWithRange:rangeDescriptionProvidingBlock:error:", a3, a4, v14, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
