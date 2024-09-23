@implementation DKIdentifier

uint64_t __95___DKIdentifier_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "_identifierFromManagedObject:readMetadata:cache:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

_DKObjectType *__79___DKIdentifier_MOConversion___identifierFromManagedObject_readMetadata_cache___block_invoke(uint64_t a1)
{
  return +[_DKObjectType objectTypeWithTypeCode:](_DKIdentifierType, "objectTypeWithTypeCode:", objc_msgSend(*(id *)(a1 + 32), "identifierType"));
}

@end
