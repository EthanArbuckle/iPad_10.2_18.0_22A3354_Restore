@implementation HDMedicalDownloadableAttachmentEntity

+ (id)databaseTable
{
  return CFSTR("medical_downloadable_attachments");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 25;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_91;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("account_identifier");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29858]), "initWithEntityClass:property:deletionAction:", objc_opt_class(), CFSTR("identifier"), 2);
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

@end
