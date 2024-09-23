@implementation NSObject

id __69__NSObject_HealthRecordUtils__hd_valueForKeyPath_rootResource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  void *v8;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(v2 + 40);
  v3 = (id *)(v2 + 40);
  if (v4)
    return 0;
  v6 = *(_QWORD *)(a1 + 32);
  obj = 0;
  +[HDHealthRecordsExtractionUtilities resourceReferencedBy:containedIn:error:](HDHealthRecordsExtractionUtilities, "resourceReferencedBy:containedIn:error:", a2, v6, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v3, obj);
  objc_msgSend(v7, "JSONObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __69__NSObject_HealthRecordUtils__hd_valueForKeyPath_rootResource_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

uint64_t __65__NSObject_HealthRecordUtils__hd_handleExtensionComponent_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "JSONDictionary");
}

@end
