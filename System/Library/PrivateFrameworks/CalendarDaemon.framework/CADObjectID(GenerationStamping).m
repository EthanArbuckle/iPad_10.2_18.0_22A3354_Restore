@implementation CADObjectID(GenerationStamping)

- (CADGenerationStampedObjectID)stampedCopyWithGeneration:()GenerationStamping
{
  return -[CADGenerationStampedObjectID initWithEntityType:entityID:databaseID:generation:]([CADGenerationStampedObjectID alloc], "initWithEntityType:entityID:databaseID:generation:", objc_msgSend(a1, "entityType"), objc_msgSend(a1, "entityID"), objc_msgSend(a1, "databaseID"), a3);
}

@end
