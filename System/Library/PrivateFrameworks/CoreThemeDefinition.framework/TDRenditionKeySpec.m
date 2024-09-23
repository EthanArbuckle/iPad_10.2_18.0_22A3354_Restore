@implementation TDRenditionKeySpec

- (void)dealloc
{
  _renditionkeytoken *scratchKey;
  objc_super v4;

  scratchKey = self->_scratchKey;
  if (scratchKey)
    free(scratchKey);
  v4.receiver = self;
  v4.super_class = (Class)TDRenditionKeySpec;
  -[TDRenditionKeySpec dealloc](&v4, sel_dealloc);
}

- (void)setDimension1:(unsigned int)a3
{
  -[TDRenditionKeySpec willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("dimension1"));
  self->_dimension1 = a3;
  -[TDRenditionKeySpec didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("dimension1"));
}

- (unsigned)dimension1
{
  unsigned int dimension1;

  -[TDRenditionKeySpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("dimension1"));
  dimension1 = self->_dimension1;
  -[TDRenditionKeySpec didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("dimension1"));
  return dimension1;
}

- (void)setDimension2:(unsigned int)a3
{
  -[TDRenditionKeySpec willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("dimension2"));
  self->_dimension2 = a3;
  -[TDRenditionKeySpec didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("dimension2"));
}

- (unsigned)dimension2
{
  unsigned int dimension2;

  -[TDRenditionKeySpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("dimension2"));
  dimension2 = self->_dimension2;
  -[TDRenditionKeySpec didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("dimension2"));
  return dimension2;
}

- (void)setScaleFactor:(unsigned int)a3
{
  -[TDRenditionKeySpec willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("scaleFactor"));
  self->_scaleFactor = a3;
  -[TDRenditionKeySpec didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("scaleFactor"));
}

- (unsigned)scaleFactor
{
  unsigned int scaleFactor;

  -[TDRenditionKeySpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("scaleFactor"));
  scaleFactor = self->_scaleFactor;
  -[TDRenditionKeySpec didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("scaleFactor"));
  return scaleFactor;
}

- (void)setSubtype:(unsigned int)a3
{
  -[TDRenditionKeySpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("subtype"));
  self->_subtype = a3;
  -[TDRenditionKeySpec didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("subtype"));
}

- (unsigned)subtype
{
  unsigned int subtype;

  -[TDRenditionKeySpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("subtype"));
  subtype = self->_subtype;
  -[TDRenditionKeySpec didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("subtype"));
  return subtype;
}

- (void)setNameIdentifier:(unsigned int)a3
{
  -[TDRenditionKeySpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("nameIdentifier"));
  self->_nameIdentifier = a3;
  -[TDRenditionKeySpec didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("nameIdentifier"));
}

- (unsigned)nameIdentifier
{
  unsigned int nameIdentifier;

  -[TDRenditionKeySpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("nameIdentifier"));
  nameIdentifier = self->_nameIdentifier;
  -[TDRenditionKeySpec didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("nameIdentifier"));
  return nameIdentifier;
}

- (void)setMemoryClass:(unsigned int)a3
{
  -[TDRenditionKeySpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("memoryClass"));
  self->_memoryClass = a3;
  -[TDRenditionKeySpec didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("memoryClass"));
}

- (unsigned)memoryClass
{
  unsigned int memoryClass;

  -[TDRenditionKeySpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("memoryClass"));
  memoryClass = self->_memoryClass;
  -[TDRenditionKeySpec willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("memoryClass"));
  return memoryClass;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TDRenditionKeySpec;
  v4 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingValueForKey_);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("scaleFactorString")))
    return (id)objc_msgSend(v4, "setByAddingObjectsFromSet:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("scaleFactor"), 0));
  return v4;
}

- (id)scaleFactorString
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), -[TDRenditionKeySpec scaleFactor](self, "scaleFactor"));
}

- (void)setScaleFactorString:(id)a3
{
  -[TDRenditionKeySpec setScaleFactor:](self, "setScaleFactor:", objc_msgSend(a3, "intValue"));
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<element=%@  part=%@  identifier=%u size=%@  direction=%@  value=%@  state=%@  presentationState=%@ previousState=%@ previousValue=%@ dim1=%u  dim2=%u layer=%@ scale=%u idiom=%@ subtype=%u, gamut=%@, graphicsFeatureSetClass=%@, memoryClass=%u, sizeClassHorizontal=%@, sizeClassVertical=%@, target=%@, appearance=%@, localization=%@ glyphSize=%@ glyphWeight=%@ deploymentTarget=%@>"), objc_msgSend((id)-[TDRenditionKeySpec element](self, "element"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec part](self, "part"), "debugDescription"), -[TDRenditionKeySpec nameIdentifier](self, "nameIdentifier"), objc_msgSend((id)-[TDRenditionKeySpec size](self, "size"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec direction](self, "direction"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec value](self, "value"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec state](self, "state"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec presentationState](self, "presentationState"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec previousState](self, "previousState"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec previousValue](self, "previousValue"), "debugDescription"), -[TDRenditionKeySpec dimension1](self, "dimension1"), -[TDRenditionKeySpec dimension2](self, "dimension2"), objc_msgSend((id)-[TDRenditionKeySpec layer](self, "layer"), "debugDescription"), -[TDRenditionKeySpec scaleFactor](self, "scaleFactor"), objc_msgSend((id)-[TDRenditionKeySpec idiom](self, "idiom"), "debugDescription"), -[TDRenditionKeySpec subtype](self, "subtype"),
               objc_msgSend((id)-[TDRenditionKeySpec gamut](self, "gamut"), "debugDescription"),
               objc_msgSend((id)-[TDRenditionKeySpec graphicsFeatureSetClass](self, "graphicsFeatureSetClass"), "debugDescription"), -[TDRenditionKeySpec memoryClass](self, "memoryClass"), objc_msgSend((id)-[TDRenditionKeySpec sizeClassHorizontal](self, "sizeClassHorizontal"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec sizeClassVertical](self, "sizeClassVertical"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec appearance](self, "appearance"), "name"), objc_msgSend((id)-[TDRenditionKeySpec localization](self, "localization"), "name"), objc_msgSend((id)-[TDRenditionKeySpec glyphSize](self, "glyphSize"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec glyphWeight](self, "glyphWeight"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "debugDescription"));
}

- (int64_t)attributeCount
{
  return -[TDRenditionKeySpec keyFormat](self, "keyFormat")[8];
}

- (void)setAttributesFromRenditionKey:(const _renditionkeytoken *)a3 withDocument:(id)a4
{
  uint64_t identifier;
  const _renditionkeytoken *v7;
  uint64_t value;
  unsigned int v9;

  identifier = a3->identifier;
  if (a3->identifier)
  {
    v7 = a3 + 1;
    do
    {
      value = v7[-1].value;
      switch((int)identifier)
      {
        case 1:
          -[TDRenditionKeySpec setElement:](self, "setElement:", objc_msgSend(a4, "elementWithIdentifier:", value));
          break;
        case 2:
          -[TDRenditionKeySpec setPart:](self, "setPart:", objc_msgSend(a4, "partWithIdentifier:", value));
          break;
        case 3:
          -[TDRenditionKeySpec setSize:](self, "setSize:", objc_msgSend(a4, "sizeWithIdentifier:", value));
          break;
        case 4:
          -[TDRenditionKeySpec setDirection:](self, "setDirection:", objc_msgSend(a4, "directionWithIdentifier:", value));
          break;
        case 6:
          -[TDRenditionKeySpec setValue:](self, "setValue:", objc_msgSend(a4, "valueWithIdentifier:", value));
          break;
        case 7:
          -[TDRenditionKeySpec setAppearance:](self, "setAppearance:", objc_msgSend(a4, "appearanceWithIdentifier:", value));
          break;
        case 8:
          -[TDRenditionKeySpec setDimension1:](self, "setDimension1:", value);
          break;
        case 9:
          -[TDRenditionKeySpec setDimension2:](self, "setDimension2:", value);
          break;
        case 10:
          -[TDRenditionKeySpec setState:](self, "setState:", objc_msgSend(a4, "stateWithIdentifier:", value));
          break;
        case 11:
          -[TDRenditionKeySpec setLayer:](self, "setLayer:", objc_msgSend(a4, "drawingLayerWithIdentifier:", value));
          break;
        case 12:
          -[TDRenditionKeySpec setScaleFactor:](self, "setScaleFactor:", value);
          break;
        case 13:
          -[TDRenditionKeySpec setLocalization:](self, "setLocalization:", objc_msgSend(a4, "localizationWithIdentifier:", value));
          break;
        case 14:
          -[TDRenditionKeySpec setPresentationState:](self, "setPresentationState:", objc_msgSend(a4, "presentationStateWithIdentifier:", value));
          break;
        case 15:
          -[TDRenditionKeySpec setIdiom:](self, "setIdiom:", objc_msgSend(a4, "idiomWithIdentifier:", value));
          break;
        case 16:
          -[TDRenditionKeySpec setSubtype:](self, "setSubtype:", value);
          break;
        case 17:
          -[TDRenditionKeySpec setNameIdentifier:](self, "setNameIdentifier:", value);
          break;
        case 18:
          -[TDRenditionKeySpec setPreviousValue:](self, "setPreviousValue:", objc_msgSend(a4, "valueWithIdentifier:", value));
          break;
        case 19:
          -[TDRenditionKeySpec setPreviousState:](self, "setPreviousState:", objc_msgSend(a4, "stateWithIdentifier:", value));
          break;
        case 20:
          -[TDRenditionKeySpec setSizeClassHorizontal:](self, "setSizeClassHorizontal:", objc_msgSend(a4, "sizeClassWithIdentifier:", value));
          break;
        case 21:
          -[TDRenditionKeySpec setSizeClassVertical:](self, "setSizeClassVertical:", objc_msgSend(a4, "sizeClassWithIdentifier:", value));
          break;
        case 22:
          -[TDRenditionKeySpec setMemoryClass:](self, "setMemoryClass:", value);
          break;
        case 23:
          -[TDRenditionKeySpec setGraphicsFeatureSetClass:](self, "setGraphicsFeatureSetClass:", objc_msgSend(a4, "graphicsFeatureSetClassWithIdentifier:", value));
          break;
        case 24:
          -[TDRenditionKeySpec setGamut:](self, "setGamut:", objc_msgSend(a4, "displayGamutWithIdentifier:", value));
          break;
        case 25:
          -[TDRenditionKeySpec setTarget:](self, "setTarget:", objc_msgSend(a4, "deploymentTargetWithIdentifier:", value));
          break;
        case 26:
          -[TDRenditionKeySpec setGlyphSize:](self, "setGlyphSize:", objc_msgSend(a4, "glyphSizeWithIdentifier:", value));
          break;
        case 27:
          -[TDRenditionKeySpec setGlyphWeight:](self, "setGlyphWeight:", objc_msgSend(a4, "glyphWeightWithIdentifier:", value));
          break;
        default:
          NSLog(CFSTR("Unexpected attribute %d in rendition key"), a2, value, identifier);
          break;
      }
      v9 = v7->identifier;
      ++v7;
      identifier = v9;
    }
    while (v9);
  }
}

- (void)getKey:(_renditionkeytoken *)a3
{
  *a3 = 0;
  objc_msgSend((id)-[TDRenditionKeySpec element](self, "element"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec part](self, "part"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec size](self, "size"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec direction](self, "direction"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec value](self, "value"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  -[TDRenditionKeySpec dimension1](self, "dimension1");
  CUIRenditionKeySetValueForAttribute();
  -[TDRenditionKeySpec dimension2](self, "dimension2");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec state](self, "state"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec presentationState](self, "presentationState"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec layer](self, "layer"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  -[TDRenditionKeySpec scaleFactor](self, "scaleFactor");
  CUIRenditionKeySetValueForAttribute();
  -[TDRenditionKeySpec nameIdentifier](self, "nameIdentifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec idiom](self, "idiom"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  -[TDRenditionKeySpec subtype](self, "subtype");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec previousState](self, "previousState"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec previousValue](self, "previousValue"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec sizeClassHorizontal](self, "sizeClassHorizontal"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec sizeClassVertical](self, "sizeClassVertical"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  -[TDRenditionKeySpec memoryClass](self, "memoryClass");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec graphicsFeatureSetClass](self, "graphicsFeatureSetClass"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec gamut](self, "gamut"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec appearance](self, "appearance"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec localization](self, "localization"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec glyphWeight](self, "glyphWeight"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec glyphSize](self, "glyphSize"), "identifier");
  CUIRenditionKeySetValueForAttribute();
}

- (const)key
{
  _renditionkeytoken *scratchKey;
  uint64_t v4;

  scratchKey = self->_scratchKey;
  if (!scratchKey)
  {
    v4 = -[TDRenditionKeySpec attributeCount](self, "attributeCount");
    if (v4 < 22)
    {
      scratchKey = self->_scratchKey;
      if (!scratchKey)
LABEL_6:
        scratchKey = self->_stackScratchKey;
    }
    else
    {
      scratchKey = (_renditionkeytoken *)malloc_type_malloc(4 * v4 + 4, 0x100004052888210uLL);
      self->_scratchKey = scratchKey;
      if (!scratchKey)
        goto LABEL_6;
    }
  }
  -[TDRenditionKeySpec getKey:](self, "getKey:", scratchKey);
  return scratchKey;
}

- (id)keyDescription
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;

  v3 = +[CoreThemeDocument targetPlatformForMOC:](CoreThemeDocument, "targetPlatformForMOC:", -[TDRenditionKeySpec managedObjectContext](self, "managedObjectContext"));
  if (!v3)
  {
    v61 = (void *)MEMORY[0x24BDD17C8];
    v60 = objc_msgSend((id)-[TDRenditionKeySpec element](self, "element"), "displayName");
    v59 = objc_msgSend((id)-[TDRenditionKeySpec part](self, "part"), "displayName");
    v58 = objc_msgSend((id)-[TDRenditionKeySpec size](self, "size"), "displayName");
    v56 = objc_msgSend((id)-[TDRenditionKeySpec direction](self, "direction"), "displayName");
    v54 = objc_msgSend((id)-[TDRenditionKeySpec value](self, "value"), "displayName");
    v52 = -[TDRenditionKeySpec nameIdentifier](self, "nameIdentifier");
    v50 = -[TDRenditionKeySpec dimension1](self, "dimension1");
    v48 = -[TDRenditionKeySpec dimension2](self, "dimension2");
    v46 = objc_msgSend((id)-[TDRenditionKeySpec state](self, "state"), "displayName");
    v44 = objc_msgSend((id)-[TDRenditionKeySpec presentationState](self, "presentationState"), "displayName");
    v42 = objc_msgSend((id)-[TDRenditionKeySpec previousState](self, "previousState"), "displayName");
    v13 = objc_msgSend((id)-[TDRenditionKeySpec previousValue](self, "previousValue"), "displayName");
    v14 = objc_msgSend((id)-[TDRenditionKeySpec layer](self, "layer"), "displayName");
    v15 = -[TDRenditionKeySpec scaleFactor](self, "scaleFactor");
    v16 = objc_msgSend((id)-[TDRenditionKeySpec gamut](self, "gamut"), "displayName");
    v17 = objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "displayName");
    v18 = objc_msgSend((id)-[TDRenditionKeySpec appearance](self, "appearance"), "name");
    v19 = objc_msgSend((id)-[TDRenditionKeySpec localization](self, "localization"), "name");
    v20 = objc_msgSend((id)-[TDRenditionKeySpec glyphWeight](self, "glyphWeight"), "displayName");
    v39 = objc_msgSend((id)-[TDRenditionKeySpec glyphSize](self, "glyphSize"), "displayName");
    v40 = objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "displayName");
    v37 = v19;
    v38 = v20;
    v35 = v17;
    v36 = v18;
    v33 = v15;
    v34 = v16;
    v31 = v13;
    v32 = v14;
    v29 = v44;
    v30 = v42;
    v28 = v46;
    v27 = v48;
    v26 = v50;
    v25 = v52;
    v24 = v54;
    v23 = v56;
    v22 = v58;
    v12 = CFSTR("(M)Key\n\telement:   \t%@\n\tpart:      \t%@\n\tsize:      \t%@\n\tdirection: \t%@\n\tvalue:     \t%@\n\tidentifier:\t%u\n\tdimension1:\t%u\n\tdimension2:\t%u\n\tstate:     \t%@\n\tpresentationState:     \t%@\n\tpreviousState:     \t%@\n\tpreviousValue:     \t%@\n\tlayer:     \t%@\n\tscale:     \t%u\n\tgamut:   \t%@\n\ttarget:    \t%@\n\tappearance:   \t%@\n\tlocalization:      \t%@\n\tglyphWeight:\t%@\n\ttglypSize: \t%@\n\tdeployment:   \t%@");
    return (id)objc_msgSend(v61, "stringWithFormat:", v12, v60, v59, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
                 v36,
                 v37,
                 v38,
                 v39,
                 v40);
  }
  if (v3 <= 5)
  {
    v61 = (void *)MEMORY[0x24BDD17C8];
    v60 = objc_msgSend((id)-[TDRenditionKeySpec element](self, "element"), "displayName");
    v59 = objc_msgSend((id)-[TDRenditionKeySpec part](self, "part"), "displayName");
    v57 = objc_msgSend((id)-[TDRenditionKeySpec value](self, "value"), "displayName");
    v55 = -[TDRenditionKeySpec nameIdentifier](self, "nameIdentifier");
    v53 = -[TDRenditionKeySpec dimension1](self, "dimension1");
    v51 = objc_msgSend((id)-[TDRenditionKeySpec state](self, "state"), "displayName");
    v49 = -[TDRenditionKeySpec scaleFactor](self, "scaleFactor");
    v47 = objc_msgSend((id)-[TDRenditionKeySpec idiom](self, "idiom"), "displayName");
    v45 = -[TDRenditionKeySpec subtype](self, "subtype");
    v43 = objc_msgSend((id)-[TDRenditionKeySpec gamut](self, "gamut"), "displayName");
    v41 = objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "displayName");
    v4 = objc_msgSend((id)-[TDRenditionKeySpec sizeClassHorizontal](self, "sizeClassHorizontal"), "displayName");
    v5 = objc_msgSend((id)-[TDRenditionKeySpec sizeClassVertical](self, "sizeClassVertical"), "displayName");
    v6 = objc_msgSend((id)-[TDRenditionKeySpec graphicsFeatureSetClass](self, "graphicsFeatureSetClass"), "displayName");
    v7 = -[TDRenditionKeySpec memoryClass](self, "memoryClass");
    v8 = objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "displayName");
    v9 = objc_msgSend((id)-[TDRenditionKeySpec appearance](self, "appearance"), "name");
    v10 = objc_msgSend((id)-[TDRenditionKeySpec localization](self, "localization"), "name");
    v11 = objc_msgSend((id)-[TDRenditionKeySpec glyphWeight](self, "glyphWeight"), "displayName");
    v39 = objc_msgSend((id)-[TDRenditionKeySpec glyphSize](self, "glyphSize"), "displayName");
    v40 = objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "displayName");
    v37 = v10;
    v38 = v11;
    v35 = v8;
    v36 = v9;
    v33 = v6;
    v34 = v7;
    v31 = v4;
    v32 = v5;
    v29 = v43;
    v30 = v41;
    v28 = v45;
    v27 = v47;
    v26 = v49;
    v25 = v51;
    v24 = v53;
    v23 = v55;
    v22 = v57;
    v12 = CFSTR("(E)Key\n\telement:   \t%@\n\tpart:      \t%@\n\tvalue:     \t%@\n\tidentifier:\t%u\n\tdimension1:\t%u\n\tstate:     \t%@\n\tscale:     \t%u\n\tidiom:   \t%@\n\tsubtype:      \t%u\n\tgamut:   \t%@\n\ttarget:   \t%@\n\tsizeClassHorizontal:   \t%@\n\tsizeClassVertical:   \t%@\n\tgraphicsFeatureSetClass:      \t%@\n\tmemoryClass:      \t%u\n\ttarget:    \t%@\n\tappearance:      \t%@\n\tlocalization:      \t%@\n\tglyphWeight:\t%@\n\ttglypSize: \t%@\n\tdeployment:   \t%@");
    return (id)objc_msgSend(v61, "stringWithFormat:", v12, v60, v59, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
                 v36,
                 v37,
                 v38,
                 v39,
                 v40);
  }
  return 0;
}

- (void)copyAttributesInto:(id)a3
{
  objc_msgSend(a3, "setState:", -[TDRenditionKeySpec state](self, "state"));
  objc_msgSend(a3, "setPresentationState:", -[TDRenditionKeySpec presentationState](self, "presentationState"));
  objc_msgSend(a3, "setValue:", -[TDRenditionKeySpec value](self, "value"));
  objc_msgSend(a3, "setSize:", -[TDRenditionKeySpec size](self, "size"));
  objc_msgSend(a3, "setDirection:", -[TDRenditionKeySpec direction](self, "direction"));
  objc_msgSend(a3, "setPart:", -[TDRenditionKeySpec part](self, "part"));
  objc_msgSend(a3, "setElement:", -[TDRenditionKeySpec element](self, "element"));
  objc_msgSend(a3, "setLayer:", -[TDRenditionKeySpec layer](self, "layer"));
  objc_msgSend(a3, "setPreviousState:", -[TDRenditionKeySpec previousState](self, "previousState"));
  objc_msgSend(a3, "setPreviousValue:", -[TDRenditionKeySpec previousValue](self, "previousValue"));
  objc_msgSend(a3, "setNameIdentifier:", -[TDRenditionKeySpec nameIdentifier](self, "nameIdentifier"));
  objc_msgSend(a3, "setDimension1:", -[TDRenditionKeySpec dimension1](self, "dimension1"));
  objc_msgSend(a3, "setDimension2:", -[TDRenditionKeySpec dimension2](self, "dimension2"));
  objc_msgSend(a3, "setScaleFactor:", -[TDRenditionKeySpec scaleFactor](self, "scaleFactor"));
  objc_msgSend(a3, "setIdiom:", -[TDRenditionKeySpec idiom](self, "idiom"));
  objc_msgSend(a3, "setSubtype:", -[TDRenditionKeySpec subtype](self, "subtype"));
  objc_msgSend(a3, "setGamut:", -[TDRenditionKeySpec gamut](self, "gamut"));
  objc_msgSend(a3, "setTarget:", -[TDRenditionKeySpec target](self, "target"));
  objc_msgSend(a3, "setSizeClassHorizontal:", -[TDRenditionKeySpec sizeClassHorizontal](self, "sizeClassHorizontal"));
  objc_msgSend(a3, "setSizeClassVertical:", -[TDRenditionKeySpec sizeClassVertical](self, "sizeClassVertical"));
  objc_msgSend(a3, "setMemoryClass:", -[TDRenditionKeySpec memoryClass](self, "memoryClass"));
  objc_msgSend(a3, "setGraphicsFeatureSetClass:", -[TDRenditionKeySpec graphicsFeatureSetClass](self, "graphicsFeatureSetClass"));
  objc_msgSend(a3, "setAppearance:", -[TDRenditionKeySpec appearance](self, "appearance"));
  objc_msgSend(a3, "setLocalization:", -[TDRenditionKeySpec localization](self, "localization"));
  objc_msgSend(a3, "setGlyphSize:", -[TDRenditionKeySpec glyphSize](self, "glyphSize"));
  objc_msgSend(a3, "setGlyphWeight:", -[TDRenditionKeySpec glyphWeight](self, "glyphWeight"));
}

- (id)dataFromAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
  v4 = (void *)-[TDRenditionKeySpec state](self, "state");
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("state"));
  v5 = (void *)-[TDRenditionKeySpec presentationState](self, "presentationState");
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("presentationState"));
  v6 = (void *)-[TDRenditionKeySpec value](self, "value");
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("value"));
  v7 = (void *)-[TDRenditionKeySpec size](self, "size");
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("size"));
  v8 = (void *)-[TDRenditionKeySpec direction](self, "direction");
  if (v8)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("direction"));
  v9 = (void *)-[TDRenditionKeySpec part](self, "part");
  if (v9)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("part"));
  v10 = (void *)-[TDRenditionKeySpec element](self, "element");
  if (v10)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("element"));
  v11 = (void *)-[TDRenditionKeySpec layer](self, "layer");
  if (v11)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("layer"));
  v12 = (void *)-[TDRenditionKeySpec idiom](self, "idiom");
  if (v12)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("idiom"));
  v13 = (void *)-[TDRenditionKeySpec gamut](self, "gamut");
  if (v13)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("gamut"));
  v14 = (void *)-[TDRenditionKeySpec target](self, "target");
  if (v14)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("target"));
  v15 = (void *)-[TDRenditionKeySpec graphicsFeatureSetClass](self, "graphicsFeatureSetClass");
  if (v15)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("graphicsFeatureSetClass"));
  v16 = (void *)-[TDRenditionKeySpec sizeClassHorizontal](self, "sizeClassHorizontal");
  if (v16)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("sizeClassHorizontal"));
  v17 = (void *)-[TDRenditionKeySpec sizeClassVertical](self, "sizeClassVertical");
  if (v17)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("sizeClassVertical"));
  v18 = (void *)-[TDRenditionKeySpec previousState](self, "previousState");
  if (v18)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("previousState"));
  v19 = (void *)-[TDRenditionKeySpec previousValue](self, "previousValue");
  if (v19)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("previousValue"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[TDRenditionKeySpec subtype](self, "subtype")), CFSTR("subtype"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[TDRenditionKeySpec nameIdentifier](self, "nameIdentifier")), CFSTR("nameIdentifier"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[TDRenditionKeySpec dimension1](self, "dimension1")), CFSTR("dimension1"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[TDRenditionKeySpec dimension2](self, "dimension2")), CFSTR("dimension2"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[TDRenditionKeySpec scaleFactor](self, "scaleFactor")), CFSTR("scaleFactor"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[TDRenditionKeySpec memoryClass](self, "memoryClass")), CFSTR("memoryClass"));
  v20 = (void *)-[TDRenditionKeySpec appearance](self, "appearance");
  if (v20)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("appearance"));
  v21 = (void *)-[TDRenditionKeySpec localization](self, "localization");
  if (v21)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v21, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("localization"));
  return (id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
}

- (void)setAttributesFromData:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v5 = (void *)-[TDRenditionKeySpec managedObjectContext](self, "managedObjectContext");
  v6 = objc_msgSend(v4, "objectForKey:", CFSTR("state"));
  if (v6)
    -[TDRenditionKeySpec setState:](self, "setState:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6))));
  v7 = objc_msgSend(v4, "objectForKey:", CFSTR("previousState"));
  if (v7)
    -[TDRenditionKeySpec setPreviousState:](self, "setPreviousState:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7))));
  v8 = objc_msgSend(v4, "objectForKey:", CFSTR("presentationState"));
  if (v8)
    -[TDRenditionKeySpec setPresentationState:](self, "setPresentationState:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8))));
  v9 = objc_msgSend(v4, "objectForKey:", CFSTR("value"));
  if (v9)
    -[TDRenditionKeySpec setValue:](self, "setValue:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9))));
  v10 = objc_msgSend(v4, "objectForKey:", CFSTR("previousValue"));
  if (v10)
    -[TDRenditionKeySpec setPreviousValue:](self, "setPreviousValue:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10))));
  v11 = objc_msgSend(v4, "objectForKey:", CFSTR("size"));
  if (v11)
    -[TDRenditionKeySpec setSize:](self, "setSize:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11))));
  v12 = objc_msgSend(v4, "objectForKey:", CFSTR("direction"));
  if (v12)
    -[TDRenditionKeySpec setDirection:](self, "setDirection:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12))));
  v13 = objc_msgSend(v4, "objectForKey:", CFSTR("part"));
  if (v13)
    -[TDRenditionKeySpec setPart:](self, "setPart:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13))));
  v14 = objc_msgSend(v4, "objectForKey:", CFSTR("element"));
  if (v14)
    -[TDRenditionKeySpec setElement:](self, "setElement:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14))));
  v15 = objc_msgSend(v4, "objectForKey:", CFSTR("layer"));
  if (v15)
    -[TDRenditionKeySpec setLayer:](self, "setLayer:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15))));
  v16 = objc_msgSend(v4, "objectForKey:", CFSTR("idiom"));
  if (v16)
    -[TDRenditionKeySpec setIdiom:](self, "setIdiom:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16))));
  v17 = objc_msgSend(v4, "objectForKey:", CFSTR("gamut"));
  if (v17)
    -[TDRenditionKeySpec setGamut:](self, "setGamut:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v17))));
  v18 = objc_msgSend(v4, "objectForKey:", CFSTR("target"));
  if (v18)
    -[TDRenditionKeySpec setTarget:](self, "setTarget:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v18))));
  v19 = objc_msgSend(v4, "objectForKey:", CFSTR("graphicsFeatureSetClass"));
  if (v19)
    -[TDRenditionKeySpec setGraphicsFeatureSetClass:](self, "setGraphicsFeatureSetClass:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v19))));
  v20 = objc_msgSend(v4, "objectForKey:", CFSTR("sizeClassHorizontal"));
  if (v20)
    -[TDRenditionKeySpec setSizeClassHorizontal:](self, "setSizeClassHorizontal:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20))));
  v21 = objc_msgSend(v4, "objectForKey:", CFSTR("sizeClassVertical"));
  if (v21)
    -[TDRenditionKeySpec setSizeClassVertical:](self, "setSizeClassVertical:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v21))));
  v22 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("subtype"));
  if (v22)
    -[TDRenditionKeySpec setSubtype:](self, "setSubtype:", objc_msgSend(v22, "intValue"));
  v23 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("dimension1"));
  if (v23)
    -[TDRenditionKeySpec setDimension1:](self, "setDimension1:", objc_msgSend(v23, "intValue"));
  v24 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("nameIdentifier"));
  if (v24)
    -[TDRenditionKeySpec setNameIdentifier:](self, "setNameIdentifier:", objc_msgSend(v24, "intValue"));
  v25 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("dimension2"));
  if (v25)
    -[TDRenditionKeySpec setDimension2:](self, "setDimension2:", objc_msgSend(v25, "intValue"));
  v26 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("scaleFactor"));
  if (v26)
    -[TDRenditionKeySpec setScaleFactor:](self, "setScaleFactor:", objc_msgSend(v26, "intValue"));
  v27 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("memoryClass"));
  if (v27)
    -[TDRenditionKeySpec setMemoryClass:](self, "setMemoryClass:", v27);
  v28 = objc_msgSend(v4, "objectForKey:", CFSTR("appearance"));
  if (v28)
    -[TDRenditionKeySpec setAppearance:](self, "setAppearance:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v28))));
  v29 = objc_msgSend(v4, "objectForKey:", CFSTR("localization"));
  if (v29)
    -[TDRenditionKeySpec setLocalization:](self, "setLocalization:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v29))));
}

- (id)copyDataFromAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v4 = -[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("dimension1"));
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("dimension1"));
  v5 = -[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("nameIdentifier"));
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("nameIdentifier"));
  v6 = -[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("dimension2"));
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("dimension2"));
  v7 = -[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("scaleFactor"));
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("scaleFactor"));
  v8 = -[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("subtype"));
  if (v8)
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("subtype"));
  v9 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("direction"));
  if (v9)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v9, "identifier")), CFSTR("direction"));
  v10 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("layer"));
  if (v10)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "identifier")), CFSTR("layer"));
  v11 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("size"));
  if (v11)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v11, "identifier")), CFSTR("size"));
  v12 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("state"));
  if (v12)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v12, "identifier")), CFSTR("state"));
  v13 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("previousState"));
  if (v13)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v13, "identifier")), CFSTR("previousState"));
  v14 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("presentationState"));
  if (v14)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v14, "identifier")), CFSTR("presentationState"));
  v15 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("idiom"));
  if (v15)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v15, "identifier")), CFSTR("idiom"));
  v16 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("gamut"));
  if (v16)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v16, "identifier")), CFSTR("gamut"));
  v17 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("graphicsFeatureSetClass"));
  if (v17)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v17, "identifier")), CFSTR("graphicsFeatureSetClass"));
  v18 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("sizeClassHorizontal"));
  if (v18)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v18, "identifier")), CFSTR("sizeClassHorizontal"));
  v19 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("sizeClassVertical"));
  if (v19)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v19, "identifier")), CFSTR("sizeClassVertical"));
  v20 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("value"));
  if (v20)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v20, "identifier")), CFSTR("value"));
  v21 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("previousValue"));
  if (v21)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v21, "identifier")), CFSTR("previousValue"));
  v22 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("element"));
  if (v22)
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v22, "copyDataFromAttributes"), CFSTR("element"));
  v23 = (void *)-[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("part"));
  if (v23)
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v23, "copyDataFromAttributes"), CFSTR("part"));
  v24 = -[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("appearance"));
  if (v24)
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("appearance"));
  v25 = -[TDRenditionKeySpec valueForKey:](self, "valueForKey:", CFSTR("localization"));
  if (v25)
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("localization"));
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0), "copy");
}

- (void)setAttributesFromCopyData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v5 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("nameIdentifier"));
  if (v5)
    -[TDRenditionKeySpec setNameIdentifier:](self, "setNameIdentifier:", objc_msgSend(v5, "intValue"));
  v6 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("dimension1"));
  if (v6)
    -[TDRenditionKeySpec setDimension1:](self, "setDimension1:", objc_msgSend(v6, "intValue"));
  v7 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("dimension2"));
  if (v7)
    -[TDRenditionKeySpec setDimension2:](self, "setDimension2:", objc_msgSend(v7, "intValue"));
  v8 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("scaleFactor"));
  if (v8)
    -[TDRenditionKeySpec setScaleFactor:](self, "setScaleFactor:", objc_msgSend(v8, "intValue"));
  v9 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("subtype"));
  if (v9)
    -[TDRenditionKeySpec setSubtype:](self, "setSubtype:", objc_msgSend(v9, "intValue"));
  v10 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("memoryClass"));
  if (v10)
    -[TDRenditionKeySpec setMemoryClass:](self, "setMemoryClass:", v10);
}

@end
