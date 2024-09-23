@implementation HMSoftwareUpdateDocumentation(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "releaseNotesSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendBool:withName:ifEqualTo:", v5 != 0, CFSTR("releaseNotesSummary"), 1);

  objc_msgSend(a1, "releaseNotes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendBool:withName:ifEqualTo:", v6 != 0, CFSTR("releaseNotes"), 1);

  objc_msgSend(a1, "textReleaseNotes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendBool:withName:ifEqualTo:", v7 != 0, CFSTR("textReleaseNotes"), 1);

  objc_msgSend(a1, "licenseAgreement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendBool:withName:ifEqualTo:", v8 != 0, CFSTR("licenseAgreement"), 1);

  objc_msgSend(a1, "licenseAgreementVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:withName:options:", v9, CFSTR("licenseAgreementVersion"), 1);

  return v4;
}

@end
