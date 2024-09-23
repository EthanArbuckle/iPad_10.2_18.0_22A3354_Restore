@implementation TDSchemaPartDefinition

- (void)dealloc
{
  objc_super v3;

  -[TDSchemaPartDefinition setPreviewImage:](self, "setPreviewImage:", 0);
  -[TDSchemaPartDefinition setRenditionGroups:](self, "setRenditionGroups:", 0);
  -[TDSchemaPartDefinition setRenditions:](self, "setRenditions:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TDSchemaPartDefinition;
  -[TDSchemaPartDefinition dealloc](&v3, sel_dealloc);
}

- (id)bestPreviewRendition
{
  NSLog(CFSTR("-[TDThemeSchemaPartDefinition bestPreviewRendition] is only available on macOS"), a2);
  return 0;
}

- (id)_schema
{
  int64_t v2;

  v2 = +[CoreThemeDocument targetPlatformForMOC:](CoreThemeDocument, "targetPlatformForMOC:", -[TDSchemaPartDefinition managedObjectContext](self, "managedObjectContext"));
  return (id)objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", v2);
}

- (void)updateDerivedRenditionData
{
  id v3;
  const $44B639E4226C4F9A32E4AF5C4306E9A0 *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[TDSchemaPartDefinition _schema](self, "_schema");
  v4 = -[TDSchemaPartDefinition cuiPartDefinition](self, "cuiPartDefinition");
  -[TDSchemaPartDefinition element](self, "element");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v3, "schemaRenditionsForPartDefinition:", v4);
LABEL_7:
    -[TDSchemaPartDefinition setRenditions:](self, "setRenditions:", v5);
    -[TDSchemaPartDefinition setRenditionGroups:](self, "setRenditionGroups:", objc_msgSend(MEMORY[0x24BE28C98], "renditionGroupsForRenditions:part:", -[TDSchemaPartDefinition renditions](self, "renditions"), v4));
    -[TDSchemaPartDefinition setPartFeatures:](self, "setPartFeatures:", v4->var4);
    -[TDSchemaPartDefinition setPreviewImage:](self, "setPreviewImage:", 0);
    return;
  }
  -[TDSchemaPartDefinition element](self, "element");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v3, "schemaEffectRenditionsForPartDefinition:", v4);
    goto LABEL_7;
  }
  -[TDSchemaPartDefinition element](self, "element");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v3, "schemaMaterialRenditionsForPartDefinition:", v4);
    goto LABEL_7;
  }
  -[TDSchemaPartDefinition element](self, "element");
  v6 = objc_opt_class();
  NSLog(CFSTR("Encountered unsupported schema element class: %@"), v6);
}

- (id)validStatesWithDocument:(id)a3
{
  void *v5;
  int v6;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDSchemaPartDefinition.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("document"));
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = -[TDSchemaPartDefinition partFeatures](self, "partFeatures");
  objc_msgSend(v5, "addObject:", objc_msgSend(a3, "stateWithIdentifier:", 0));
  if ((v6 & 0x1000) == 0)
  {
    if ((v6 & 0x100) != 0)
    {
      objc_msgSend(v5, "addObject:", objc_msgSend(a3, "stateWithIdentifier:", 1));
      if ((v6 & 0x800) != 0)
      {
LABEL_6:
        if ((v6 & 0x80000) != 0)
        {
LABEL_8:
          objc_msgSend(v5, "addObject:", objc_msgSend(a3, "stateWithIdentifier:", 4));
          return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
        }
LABEL_7:
        objc_msgSend(v5, "addObject:", objc_msgSend(a3, "stateWithIdentifier:", 4));
        goto LABEL_8;
      }
    }
    else if ((v6 & 0x800) != 0)
    {
      goto LABEL_6;
    }
    objc_msgSend(v5, "addObject:", objc_msgSend(a3, "stateWithIdentifier:", 2));
    if ((v6 & 0x80000) != 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
}

- (int64_t)_renditionKeyValueForTokenIdentifier:(unsigned __int16)a3
{
  uint64_t v3;

  v3 = a3;
  if (!-[NSArray count](-[TDSchemaPartDefinition renditions](self, "renditions"), "count"))
    -[TDSchemaPartDefinition updateDerivedRenditionData](self, "updateDerivedRenditionData");
  if (-[NSArray count](-[TDSchemaPartDefinition renditions](self, "renditions"), "count"))
    return objc_msgSend(-[NSArray objectAtIndex:](self->renditions, "objectAtIndex:", 0), "valueForTokenIdentifier:", v3);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDSchemaPartDefinition.m"), 181, CFSTR("TDSchemaPartDefinition: unexpected value for CUIThemeAttributeName: %u"), v3);
  return -1;
}

- (int64_t)elementID
{
  -[TDSchemaPartDefinition cuiPartDefinition](self, "cuiPartDefinition");
  return CUIRenditionKeyValueForAttribute();
}

- (int64_t)partID
{
  -[TDSchemaPartDefinition cuiPartDefinition](self, "cuiPartDefinition");
  return CUIRenditionKeyValueForAttribute();
}

- (id)displayName
{
  const $44B639E4226C4F9A32E4AF5C4306E9A0 *v2;

  v2 = -[TDSchemaPartDefinition cuiPartDefinition](self, "cuiPartDefinition");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v2->var1);
}

- (const)cuiPartDefinition
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = objc_msgSend((id)-[TDSchemaPartDefinition element](self, "element"), "name");
  v4 = -[TDSchemaPartDefinition name](self, "name");
  v5 = -[TDSchemaPartDefinition _schema](self, "_schema");
  -[TDSchemaPartDefinition element](self, "element");
  return (const $44B639E4226C4F9A32E4AF5C4306E9A0 *)objc_msgSend(v5, "partDefinitionWithName:forElementDefinition:", v4, objc_msgSend((id)objc_opt_class(), "elementDefinitionWithName:withSchema:", v3, v5));
}

- (CUIImage)previewImage
{
  CUIImage *result;

  result = self->previewImage;
  if (!result)
  {
    -[TDSchemaPartDefinition updateDerivedRenditionData](self, "updateDerivedRenditionData");
    return self->previewImage;
  }
  return result;
}

- (NSArray)renditions
{
  NSArray *result;

  result = self->renditions;
  if (!result)
  {
    -[TDSchemaPartDefinition updateDerivedRenditionData](self, "updateDerivedRenditionData");
    return self->renditions;
  }
  return result;
}

- (NSArray)renditionGroups
{
  NSArray *result;

  result = self->renditionGroups;
  if (!result)
  {
    -[TDSchemaPartDefinition updateDerivedRenditionData](self, "updateDerivedRenditionData");
    return self->renditionGroups;
  }
  return result;
}

- (unint64_t)partFeatures
{
  unint64_t result;

  result = self->partFeatures;
  if (!result)
  {
    -[TDSchemaPartDefinition updateDerivedRenditionData](self, "updateDerivedRenditionData");
    return self->partFeatures;
  }
  return result;
}

- (void)didTurnIntoFault
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TDSchemaPartDefinition;
  -[TDSchemaPartDefinition didTurnIntoFault](&v3, sel_didTurnIntoFault);
  -[TDSchemaPartDefinition setPreviewImage:](self, "setPreviewImage:", 0);
  -[TDSchemaPartDefinition setRenditions:](self, "setRenditions:", 0);
  -[TDSchemaPartDefinition setRenditionGroups:](self, "setRenditionGroups:", 0);
  -[TDSchemaPartDefinition setPartFeatures:](self, "setPartFeatures:", 0);
}

- (void)setPreviewImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setRenditions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setRenditionGroups:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void)setPartFeatures:(unint64_t)a3
{
  self->partFeatures = a3;
}

@end
