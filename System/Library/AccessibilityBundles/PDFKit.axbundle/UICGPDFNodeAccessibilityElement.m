@implementation UICGPDFNodeAccessibilityElement

- (id)_accessibilityPDFCustomLinksRotor
{
  JUMPOUT(0x2349187C4);
}

- (void)_accessibilitySetPDFCustomLinksRotor:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (UICGPDFNodeAccessibilityElement)initWithAccessibilityContainer:(id)a3 pdfNodeRef:(CGPDFTaggedNode *)a4 withPage:(id)a5
{
  UICGPDFNodeAccessibilityElement *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UICGPDFNodeAccessibilityElement;
  v6 = -[AXPDFNodeElement initWithAccessibilityContainer:withPage:](&v9, sel_initWithAccessibilityContainer_withPage_, a3, a5);
  -[UICGPDFNodeAccessibilityElement setNodeRef:](v6, "setNodeRef:", a4);
  if (a4)
    -[UICGPDFNodeAccessibilityElement setAltText:](v6, "setAltText:", CGPDFTaggedNodeGetAltText());
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__axHandleUpdateVisibility_, AXPDFVisibiltyUpdatedNotification, 0);

  return v6;
}

- (id)accessibilityElements
{
  void *v3;
  uint64_t ChildCount;
  unint64_t v5;
  unint64_t v6;
  UICGPDFListContainerAccessibilityElement *v7;
  void *v8;
  UICGPDFNodeAccessibilityElement *v9;
  uint64_t v10;
  void *v11;
  UICGPDFNodeAccessibilityElement *v12;
  UICGPDFNodeAccessibilityElement *v13;
  uint64_t ChildAtIndex;
  void *v15;

  -[UICGPDFNodeAccessibilityElement cachedAXElements](self, "cachedAXElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
    if (CGPDFTaggedNodeGetType())
    {
      -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
      ChildCount = CGPDFTaggedNodeGetChildCount();
      if (ChildCount)
      {
        v5 = ChildCount;
        v6 = 0;
        do
        {
          -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
          if (CGPDFTaggedNodeGetType() == 300
            || (-[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef"),
                CGPDFTaggedNodeGetChildAtIndex(),
                CGPDFTaggedNodeGetType() != 301))
          {
            v13 = [UICGPDFNodeAccessibilityElement alloc];
            -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
            ChildAtIndex = CGPDFTaggedNodeGetChildAtIndex();
            -[AXPDFNodeElement page](self, "page");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = -[UICGPDFNodeAccessibilityElement initWithAccessibilityContainer:pdfNodeRef:withPage:](v13, "initWithAccessibilityContainer:pdfNodeRef:withPage:", self, ChildAtIndex, v15);

            -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
            if (CGPDFTaggedNodeGetType() == 300)
              -[UICGPDFListContainerAccessibilityElement setListItemNumber:](v7, "setListItemNumber:", v6);
            objc_msgSend(v3, "axSafelyAddObject:", v7);
            ++v6;
          }
          else
          {
            v7 = -[UICGPDFListContainerAccessibilityElement initWithAccessibilityContainer:]([UICGPDFListContainerAccessibilityElement alloc], "initWithAccessibilityContainer:", self);
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (v6 < v5)
            {
              do
              {
                v9 = [UICGPDFNodeAccessibilityElement alloc];
                -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
                v10 = CGPDFTaggedNodeGetChildAtIndex();
                -[AXPDFNodeElement page](self, "page");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = -[UICGPDFNodeAccessibilityElement initWithAccessibilityContainer:pdfNodeRef:withPage:](v9, "initWithAccessibilityContainer:pdfNodeRef:withPage:", v7, v10, v11);

                -[UICGPDFNodeAccessibilityElement setListItemNumber:](v12, "setListItemNumber:", v6);
                objc_msgSend(v8, "axSafelyAddObject:", v12);

                ++v6;
              }
              while (v5 != v6);
              v6 = v5;
            }
            -[UICGPDFListContainerAccessibilityElement setAccessibilityElements:](v7, "setAccessibilityElements:", v8);
            objc_msgSend(v3, "axSafelyAddObject:", v7);

          }
        }
        while (v6 < v5);
      }
      -[UICGPDFNodeAccessibilityElement setCachedAXElements:](self, "setCachedAXElements:", v3);
    }
  }
  return v3;
}

- (CGRect)accessibilityFrameForScrolling
{
  CGRect v2;

  -[UICGPDFNodeAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  return CGRectInset(v2, 0.0, -80.0);
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  CGPDFTaggedNodeGetBounds();
  -[AXPDFNodeElement axConvertBoundsFromPageToScreenCoordinates:](self, "axConvertBoundsFromPageToScreenCoordinates:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)accessibilityLabel
{
  int Type;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  id v21;
  void *v22;
  objc_super v23;
  objc_super v24;

  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  Type = CGPDFTaggedNodeGetType();
  if (Type != 301)
  {
    if ((Type & 0xFFFFFFFE) == 0x192)
    {
      -[UICGPDFNodeAccessibilityElement _attributedAccessibilityLabelForNode:](self, "_attributedAccessibilityLabelForNode:", -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        objc_msgSend(MEMORY[0x24BDFEA60], "string");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[UICGPDFNodeAccessibilityElement cachedAXFigureChildrenNodesOfTableCellNode](self, "cachedAXFigureChildrenNodesOfTableCellNode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        -[UICGPDFNodeAccessibilityElement _findFigureChildrenNodesOfTableCellNode:](self, "_findFigureChildrenNodesOfTableCellNode:", self);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v6, "mutableCopy");
        -[UICGPDFNodeAccessibilityElement setCachedAXFigureChildrenNodesOfTableCellNode:](self, "setCachedAXFigureChildrenNodesOfTableCellNode:", v14);

      }
      if (!objc_msgSend(v6, "count"))
        goto LABEL_21;
      UIAXStringForAllChildren();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendStringOrAXAttributedString:", v15);
      goto LABEL_20;
    }
    if (Type == 107)
    {
      accessibilityLocalizedString(CFSTR("table.of.contents"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (Type == 700)
      {
        -[UICGPDFNodeAccessibilityElement cachedAXCaptionChildrenNodesOfFigureNode](self, "cachedAXCaptionChildrenNodesOfFigureNode");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          -[UICGPDFNodeAccessibilityElement _findCaptionChildrenNodesOfFigureNode:](self, "_findCaptionChildrenNodesOfFigureNode:", self);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v6, "mutableCopy");
          -[UICGPDFNodeAccessibilityElement setCachedAXCaptionChildrenNodesOfFigureNode:](self, "setCachedAXCaptionChildrenNodesOfFigureNode:", v16);

        }
        if (!objc_msgSend(v6, "count"))
        {
          -[UICGPDFNodeAccessibilityElement altText](self, "altText");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "length");

          if (!v18)
          {
            -[UICGPDFNodeAccessibilityElement _attributedAccessibilityLabelForNode:](self, "_attributedAccessibilityLabelForNode:", -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "length"))
            {
              v21 = v11;
            }
            else
            {
              v24.receiver = self;
              v24.super_class = (Class)UICGPDFNodeAccessibilityElement;
              -[UICGPDFNodeAccessibilityElement accessibilityLabel](&v24, sel_accessibilityLabel);
              v21 = (id)objc_claimAutoreleasedReturnValue();
            }
            v4 = v21;
            goto LABEL_5;
          }
        }
        -[UICGPDFNodeAccessibilityElement altText](self, "altText");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x234918764](v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
        goto LABEL_21;
      }
      if (+[UICGPDFNodeAccessibilityElement _containsOnlyTextChildren:](UICGPDFNodeAccessibilityElement, "_containsOnlyTextChildren:", -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef")))
      {
        -[UICGPDFNodeAccessibilityElement _attributedAccessibilityLabelForNode:](self, "_attributedAccessibilityLabelForNode:", -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23.receiver = self;
        v23.super_class = (Class)UICGPDFNodeAccessibilityElement;
        -[UICGPDFNodeAccessibilityElement accessibilityLabel](&v23, sel_accessibilityLabel);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    return v20;
  }
  -[UICGPDFNodeAccessibilityElement _attributedAccessibilityLabelForNode:](self, "_attributedAccessibilityLabelForNode:", -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICGPDFNodeAccessibilityElement _findLabelChildNodeOfListItem:](self, "_findLabelChildNodeOfListItem:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "nodeRef");
    CGPDFTaggedNodeGetTextRange();
    v8 = v7;
    -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
    CGPDFTaggedNodeGetTextRange();
    v10 = v9;
    -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
    -[UICGPDFNodeAccessibilityElement _accessibilityStringForListType:](self, "_accessibilityStringForListType:", CGPDFTaggedNodeGetListStyle());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v4, "attributedSubstringFromRange:", v8, v10 - v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setAttribute:forKey:", v11, *MEMORY[0x24BDFEBB0]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[UICGPDFNodeAccessibilityElement listItemNumber](self, "listItemNumber"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAttribute:forKey:", v13, *MEMORY[0x24BDFEBA8]);

      v4 = v12;
    }
LABEL_5:

  }
LABEL_21:

  return v4;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  int Type;
  _QWORD *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  unint64_t v13;
  objc_super v14;

  -[UICGPDFNodeAccessibilityElement _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("StoredTraits"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "unsignedLongLongValue");
    goto LABEL_16;
  }
  v14.receiver = self;
  v14.super_class = (Class)UICGPDFNodeAccessibilityElement;
  v6 = -[UICGPDFNodeAccessibilityElement accessibilityTraits](&v14, sel_accessibilityTraits);
  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  Type = CGPDFTaggedNodeGetType();
  if (Type <= 401)
  {
    if ((Type - 201) >= 7)
      goto LABEL_7;
    v8 = (_QWORD *)MEMORY[0x24BDF73C0];
    goto LABEL_6;
  }
  switch(Type)
  {
    case 402:
      v13 = -[UICGPDFNodeAccessibilityElement _findTraitsForTableCellElements](self, "_findTraitsForTableCellElements");
      v6 |= v13 | *MEMORY[0x24BDF73C0];
      break;
    case 403:
      v6 |= -[UICGPDFNodeAccessibilityElement _findTraitsForTableCellElements](self, "_findTraitsForTableCellElements");
      break;
    case 700:
      v8 = (_QWORD *)MEMORY[0x24BDF73C8];
LABEL_6:
      v6 |= *v8;
      break;
  }
LABEL_7:
  if (-[UICGPDFNodeAccessibilityElement _isContainerOfOnlyOneLinkNodeChild](self, "_isContainerOfOnlyOneLinkNodeChild")
    || -[UICGPDFNodeAccessibilityElement _pdfElementHasLinkContainer](self, "_pdfElementHasLinkContainer"))
  {
    v6 |= *MEMORY[0x24BDF73D8];
  }
  if (-[AXPDFNodeElement pdfViewRequiresPageTurning](self, "pdfViewRequiresPageTurning")
    && -[AXPDFNodeElement isLastNodeInPage](self, "isLastNodeInPage"))
  {
    v6 |= *MEMORY[0x24BDF73B8];
  }
  v9 = -[UICGPDFNodeAccessibilityElement isAccessibilityElement](self, "isAccessibilityElement");
  v10 = *MEMORY[0x24BEBB178];
  if (v9)
    v10 = 0;
  v5 = v10 | v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICGPDFNodeAccessibilityElement _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v11, CFSTR("StoredTraits"));

LABEL_16:
  return v5;
}

- (BOOL)isAccessibilityElement
{
  BOOL v3;
  int Type;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  BOOL v11;
  CGRect v12;

  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  CGPDFTaggedNodeGetBounds();
  if (CGRectIsNull(v12))
    return 0;
  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  Type = CGPDFTaggedNodeGetType();
  v3 = 1;
  if (Type > 401)
  {
    if ((Type - 402) < 2)
      return v3;
    if (Type == 700)
    {
      -[UICGPDFNodeAccessibilityElement cachedAXCaptionChildrenNodesOfFigureNode](self, "cachedAXCaptionChildrenNodesOfFigureNode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICGPDFNodeAccessibilityElement _attributedAccessibilityLabelForNode:](self, "_attributedAccessibilityLabelForNode:", -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
LABEL_13:

        return v3;
      }
      if (!v5)
      {
        -[UICGPDFNodeAccessibilityElement _findCaptionChildrenNodesOfFigureNode:](self, "_findCaptionChildrenNodesOfFigureNode:", self);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v5, "mutableCopy");
        -[UICGPDFNodeAccessibilityElement setCachedAXCaptionChildrenNodesOfFigureNode:](self, "setCachedAXCaptionChildrenNodesOfFigureNode:", v7);

      }
      -[UICGPDFNodeAccessibilityElement altText](self, "altText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length") || objc_msgSend(v5, "count"))
      {

LABEL_12:
        v3 = 1;
        goto LABEL_13;
      }
      -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
      if (CGPDFTaggedNodeIsImageFigure())
      {
        v11 = -[UICGPDFNodeAccessibilityElement _isSubFigure](self, "_isSubFigure");

        if (!v11)
          goto LABEL_12;
      }
      else
      {

      }
      v3 = 0;
      goto LABEL_13;
    }
    return +[UICGPDFNodeAccessibilityElement _containsOnlyTextChildren:](UICGPDFNodeAccessibilityElement, "_containsOnlyTextChildren:", -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef"));
  }
  if (Type == 108)
  {
    -[UICGPDFNodeAccessibilityElement _findTOCIChildNodeOfNode:](self, "_findTOCIChildNodeOfNode:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v10 == 0;

    return v3;
  }
  if (Type != 301)
    return +[UICGPDFNodeAccessibilityElement _containsOnlyTextChildren:](UICGPDFNodeAccessibilityElement, "_containsOnlyTextChildren:", -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef"));
  return v3;
}

- (id)accessibilityLanguage
{
  void *v3;
  objc_super v5;

  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  if (CGPDFTaggedNodeGetLanguageText())
  {
    -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
    CGPDFTaggedNodeGetLanguageText();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UICGPDFNodeAccessibilityElement;
    -[UICGPDFNodeAccessibilityElement accessibilityLanguage](&v5, sel_accessibilityLanguage);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)accessibilityContainerType
{
  objc_super v4;

  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  if (CGPDFTaggedNodeGetType() == 400)
    return 1;
  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  if (CGPDFTaggedNodeGetType() == 300)
    return 2;
  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  if (CGPDFTaggedNodeGetType() == 107)
    return 14;
  v4.receiver = self;
  v4.super_class = (Class)UICGPDFNodeAccessibilityElement;
  return -[UICGPDFNodeAccessibilityElement accessibilityContainerType](&v4, sel_accessibilityContainerType);
}

- (id)accessibilityIdentification
{
  int Type;
  int v3;
  id result;

  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  Type = CGPDFTaggedNodeGetType();
  v3 = Type;
  if (Type > 399)
  {
    if (Type > 599)
    {
      if (Type > 699)
      {
        switch(Type)
        {
          case 700:
            return CFSTR("AX_Tagged_Node_Figure");
          case 701:
            return CFSTR("AX_Tagged_Node_Formula");
          case 702:
            return CFSTR("AX_Tagged_Node_Form");
          default:
            return CFSTR("AX_Tagged_Unknown");
        }
      }
      else
      {
        switch(Type)
        {
          case 600:
            result = CFSTR("AX_Tagged_Node_Ruby");
            break;
          case 601:
            result = CFSTR("AX_Tagged_Node_Ruby_B");
            break;
          case 602:
            result = CFSTR("AX_Tagged_Node_Ruby_T");
            break;
          case 603:
            result = CFSTR("AX_Tagged_Node_Ruby_Punctuation");
            break;
          case 604:
            result = CFSTR("AX_Tagged_Node_Warichu");
            break;
          case 605:
            result = CFSTR("AX_Tagged_Node_Warichu_T");
            break;
          case 606:
            result = CFSTR("AX_Tagged_Node_Warichu_Punctuation");
            break;
          default:
            return CFSTR("AX_Tagged_Unknown");
        }
      }
    }
    else
    {
      switch(Type)
      {
        case 500:
          result = CFSTR("AX_Tagged_Node_Span");
          break;
        case 501:
          result = CFSTR("AX_Tagged_Node_Quote");
          break;
        case 502:
          result = CFSTR("AX_Tagged_Node_Note");
          break;
        case 503:
          result = CFSTR("AX_Tagged_Node_Reference");
          break;
        case 504:
          result = CFSTR("AX_Tagged_Node_BibEntry");
          break;
        case 505:
          result = CFSTR("AX_Tagged_Node_Code");
          break;
        case 506:
          result = CFSTR("AX_Tagged_Node_Link");
          break;
        case 507:
          result = CFSTR("AX_Tagged_Node_Annotation");
          break;
        default:
          switch(Type)
          {
            case 400:
              result = CFSTR("AX_Tagged_Node_Table");
              break;
            case 401:
              result = CFSTR("AX_Tagged_Node_Table_Row");
              break;
            case 402:
              result = CFSTR("AX_Tagged_Node_Table_Header_Cell");
              break;
            case 403:
              result = CFSTR("AX_Tagged_Node_Table_Data_Cell");
              break;
            case 404:
              result = CFSTR("AX_Tagged_Node_Table_Header");
              break;
            case 405:
              result = CFSTR("AX_Tagged_Node_Table_Body");
              break;
            case 406:
              result = CFSTR("AX_Tagged_Node_Table_Footer");
              break;
            default:
              return CFSTR("AX_Tagged_Unknown");
          }
          break;
      }
    }
  }
  else
  {
    result = CFSTR("AX_Tagged_Node_Paragraph");
    if (v3 > 199)
    {
      switch(v3)
      {
        case 200:
          return result;
        case 201:
          result = CFSTR("AX_Tagged_Node_Heading");
          break;
        case 202:
          result = CFSTR("AX_Tagged_Node_Heading_Level_1");
          break;
        case 203:
          result = CFSTR("AX_Tagged_Node_Heading_Level_2");
          break;
        case 204:
          result = CFSTR("AX_Tagged_Node_Heading_Level_3");
          break;
        case 205:
          result = CFSTR("AX_Tagged_Node_Heading_Level_4");
          break;
        case 206:
          result = CFSTR("AX_Tagged_Node_Heading_Level_5");
          break;
        case 207:
          result = CFSTR("AX_Tagged_Node_Heading_Level_6");
          break;
        default:
          switch(v3)
          {
            case 300:
              result = CFSTR("AX_Tagged_Node_List_Container");
              break;
            case 301:
              result = CFSTR("AX_Tagged_Node_List_Item");
              break;
            case 302:
              result = CFSTR("AX_Tagged_Node_List_Item_Label");
              break;
            case 303:
              result = CFSTR("AX_Tagged_Node_List_Item_Body");
              break;
            default:
              return CFSTR("AX_Tagged_Unknown");
          }
          break;
      }
    }
    else
    {
      switch(v3)
      {
        case 'd':
          result = CFSTR("AX_Tagged_Node_Document");
          break;
        case 'e':
          result = CFSTR("AX_Tagged_Node_Part");
          break;
        case 'f':
          result = CFSTR("AX_Tagged_Node_Art");
          break;
        case 'g':
          result = CFSTR("AX_Tagged_Node_Sect");
          break;
        case 'h':
          result = CFSTR("AX_Tagged_Node_Div");
          break;
        case 'i':
          result = CFSTR("AX_Tagged_Node_BlockQuote");
          break;
        case 'j':
          result = CFSTR("AX_Tagged_Node_Captioh");
          break;
        case 'k':
          result = CFSTR("AX_Tagged_Node_Table_of_Contents");
          break;
        case 'l':
          result = CFSTR("AX_Tagged_Node_Table_of_Contents_Item");
          break;
        case 'm':
          result = CFSTR("AX_Tagged_Node_Index");
          break;
        case 'n':
          result = CFSTR("AX_Tagged_Node_NonStruct");
          break;
        case 'o':
          result = CFSTR("AX_Tagged_Node_Private");
          break;
        default:
          if (v3)
          {
            if (v3 != 1)
              return CFSTR("AX_Tagged_Unknown");
            result = CFSTR("AX_Tagged_Node_Word");
          }
          break;
      }
    }
  }
  return result;
}

- (id)accessibilityCustomRotors
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[UICGPDFNodeAccessibilityElement _accessibilityLinks](self, "_accessibilityLinks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[UICGPDFNodeAccessibilityElement _accessibilityPDFCustomLinksRotor](self, "_accessibilityPDFCustomLinksRotor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_initWeak(&location, self);
    v6 = objc_alloc(MEMORY[0x24BDF6790]);
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __60__UICGPDFNodeAccessibilityElement_accessibilityCustomRotors__block_invoke;
    v12 = &unk_2502DF1A0;
    objc_copyWeak(&v13, &location);
    v5 = (void *)objc_msgSend(v6, "initWithSystemType:itemSearchBlock:", 1, &v9);
    -[UICGPDFNodeAccessibilityElement _accessibilitySetPDFCustomLinksRotor:](self, "_accessibilitySetPDFCustomLinksRotor:", v5, v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  v15[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __60__UICGPDFNodeAccessibilityElement_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(v4);
    objc_msgSend(v6, "_accessibilityLinks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      v8 = objc_loadWeakRetained(v4);
      objc_msgSend(v8, "_accessibilityCustomRotorResultHelper:array:", v3, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)accessibilityRowCount
{
  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  if (CGPDFTaggedNodeGetType() != 400)
    return 0;
  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  return CGPDFTaggedNodeGetTableRowCount();
}

- (unint64_t)accessibilityColumnCount
{
  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  if (CGPDFTaggedNodeGetType() != 400)
    return 0;
  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  return CGPDFTaggedNodeGetTableColumnCount();
}

- (id)accessibilityHeaderElementsForRow:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[UICGPDFNodeAccessibilityElement _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICGPDFNodeAccessibilityElement cachedAXPDFTableCellNodes](self, "cachedAXPDFTableCellNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[UICGPDFNodeAccessibilityElement _findTableCellNodesOfTableNode:withHeadersOnly:](self, "_findTableCellNodesOfTableNode:withHeadersOnly:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    -[UICGPDFNodeAccessibilityElement setCachedAXPDFTableCellNodes:](self, "setCachedAXPDFTableCellNodes:", v7);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v14, "accessibilityRowRange") == a3)
          objc_msgSend(v8, "axSafelyAddObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        if (*(UICGPDFNodeAccessibilityElement **)(*((_QWORD *)&v23 + 1) + 8 * j) == self)
        {

          objc_msgSend(MEMORY[0x24BDBCE30], "array", (_QWORD)v23);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v17)
        continue;
      break;
    }
  }

  v20 = v15;
LABEL_22:
  v21 = v20;

  return v21;
}

BOOL __69__UICGPDFNodeAccessibilityElement_accessibilityHeaderElementsForRow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessibilityContainerType") == 1;
}

- (id)accessibilityHeaderElementsForColumn:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[UICGPDFNodeAccessibilityElement _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_302, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICGPDFNodeAccessibilityElement cachedAXPDFTableCellNodes](self, "cachedAXPDFTableCellNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[UICGPDFNodeAccessibilityElement _findTableCellNodesOfTableNode:withHeadersOnly:](self, "_findTableCellNodesOfTableNode:withHeadersOnly:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    -[UICGPDFNodeAccessibilityElement setCachedAXPDFTableCellNodes:](self, "setCachedAXPDFTableCellNodes:", v7);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_303, 1, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "accessibilityColumnRange") == a3 && v15 != 0)
          objc_msgSend(v8, "axSafelyAddObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

BOOL __72__UICGPDFNodeAccessibilityElement_accessibilityHeaderElementsForColumn___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessibilityContainerType") == 1;
}

BOOL __72__UICGPDFNodeAccessibilityElement_accessibilityHeaderElementsForColumn___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "nodeRef");
    v3 = CGPDFTaggedNodeGetType() == 404;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)accessibilityDataTableCellElementForRow:(unint64_t)a3 column:(unint64_t)a4
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[UICGPDFNodeAccessibilityElement _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_304, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICGPDFNodeAccessibilityElement _findTableCellNodesOfTableNode:withHeadersOnly:](self, "_findTableCellNodesOfTableNode:withHeadersOnly:", v7, 0);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "nodeRef", (_QWORD)v16);
        if (CGPDFTaggedNodeGetTableCellColumnSpan() == a4)
        {
          objc_msgSend(v13, "nodeRef");
          if (CGPDFTaggedNodeGetTableCellRowSpan() == a3)
          {
            v14 = v13;
            goto LABEL_12;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

BOOL __82__UICGPDFNodeAccessibilityElement_accessibilityDataTableCellElementForRow_column___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessibilityContainerType") == 1;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger TableCellRowSpan;
  NSUInteger v4;
  _NSRange result;

  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  if ((int)CGPDFTaggedNodeGetType() < 401
    || (-[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef"), (int)CGPDFTaggedNodeGetType() > 406)
    || (-[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef"),
        TableCellRowSpan = CGPDFTaggedNodeGetTableCellRowSpan(),
        TableCellRowSpan == 0x7FFFFFFF)
    || TableCellRowSpan == -1)
  {
    v4 = 0;
    TableCellRowSpan = 0x7FFFFFFFLL;
  }
  result.length = v4;
  result.location = TableCellRowSpan;
  return result;
}

- (_NSRange)accessibilityColumnRange
{
  NSUInteger TableCellColumnSpan;
  NSUInteger v4;
  _NSRange result;

  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  if ((int)CGPDFTaggedNodeGetType() < 401
    || (-[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef"), (int)CGPDFTaggedNodeGetType() > 406)
    || (-[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef"),
        TableCellColumnSpan = CGPDFTaggedNodeGetTableCellColumnSpan(),
        TableCellColumnSpan == 0x7FFFFFFF)
    || TableCellColumnSpan == -1)
  {
    v4 = 0;
    TableCellColumnSpan = 0x7FFFFFFFLL;
  }
  result.length = v4;
  result.location = TableCellColumnSpan;
  return result;
}

- (void)_axHandleUpdateVisibility:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", AXPDFVisibiltyUpdatedNotification);

  if (v5)
    -[UICGPDFNodeAccessibilityElement setCachedAXPDFOtherLinks:](self, "setCachedAXPDFOtherLinks:", 0);
}

- (id)_accessibilityHeadingLevel
{
  void *v3;
  id result;
  objc_super v5;

  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  switch(CGPDFTaggedNodeGetType())
  {
    case 0xC9u:
      v5.receiver = self;
      v5.super_class = (Class)UICGPDFNodeAccessibilityElement;
      -[UICGPDFNodeAccessibilityElement _accessibilityHeadingLevel](&v5, sel__accessibilityHeadingLevel);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 0xCAu:
      result = &unk_2502E2200;
      break;
    case 0xCBu:
      result = &unk_2502E2218;
      break;
    case 0xCCu:
      result = &unk_2502E2230;
      break;
    case 0xCDu:
      result = &unk_2502E2248;
      break;
    case 0xCEu:
      result = &unk_2502E2260;
      break;
    case 0xCFu:
      v3 = &unk_2502E2278;
LABEL_10:
      result = v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)_accessibilityStringForListType:(int)a3
{
  if (a3 != 257)
    return 0;
  accessibilityLocalizedString(CFSTR("bullet"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)_containsOnlyTextChildren:(CGPDFTaggedNode *)a3
{
  unint64_t ChildCount;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t ChildAtIndex;
  int Type;
  BOOL v9;
  _BOOL4 v10;
  int v11;

  ChildCount = CGPDFTaggedNodeGetChildCount();
  if (ChildCount >= 0x64)
    v4 = 100;
  else
    v4 = ChildCount;
  if (!v4)
  {
LABEL_19:
    LOBYTE(v11) = 1;
    return v11;
  }
  v5 = 0;
  v6 = 0;
  while (1)
  {
    ChildAtIndex = CGPDFTaggedNodeGetChildAtIndex();
    Type = CGPDFTaggedNodeGetType();
    v9 = !v5 && Type == 1;
    v10 = v9;
    v6 |= v10;
    if ((v6 & 1) != 0)
      break;
    if (Type != 200)
    {
      v11 = IsCGPDFTaggedNodeTypeInline();
      if (!v11)
        return v11;
    }
    v11 = +[UICGPDFNodeAccessibilityElement _containsOnlyTextChildren:](UICGPDFNodeAccessibilityElement, "_containsOnlyTextChildren:", ChildAtIndex);
    if (!v11)
      return v11;
LABEL_18:
    if (v4 == ++v5)
      goto LABEL_19;
  }
  if (Type == 1)
    goto LABEL_18;
  if (Type == 700)
    LOBYTE(v11) = CGPDFTaggedNodeIsImageFigure() ^ 1;
  else
    LOBYTE(v11) = 0;
  return v11;
}

- (id)_attributedAccessibilityLabelForNode:(CGPDFTaggedNode *)a3
{
  void *String;
  void *v5;
  void *v6;
  uint64_t TextRange;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  String = (void *)CGPDFTaggedNodeCreateString();
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", String);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICGPDFNodeAccessibilityElement accessibilityLanguage](self, "accessibilityLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    TextRange = CGPDFTaggedNodeGetTextRange();
    v9 = v8;
    if (TextRange == -1)
      v10 = 0x7FFFFFFFLL;
    else
      v10 = TextRange;
    -[UICGPDFNodeAccessibilityElement accessibilityLanguage](self, "accessibilityLanguage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:withRange:", v11, *MEMORY[0x24BDFEBE0], v10, v9);

  }
  -[UICGPDFNodeAccessibilityElement cachedAXPDFLinks](self, "cachedAXPDFLinks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __72__UICGPDFNodeAccessibilityElement__attributedAccessibilityLabelForNode___block_invoke;
    v14[3] = &unk_2502DF248;
    v15 = v5;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v14);

  }
  return v5;
}

void __72__UICGPDFNodeAccessibilityElement__attributedAccessibilityLabelForNode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t TextRange;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "nodeRef");
    TextRange = CGPDFTaggedNodeGetTextRange();
    if (TextRange == -1)
      v5 = 0x7FFFFFFFLL;
    else
      v5 = TextRange;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v6, "range");
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "setAttribute:forKey:withRange:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEBA0], v5, v4);
  }

}

- (BOOL)_isSubFigure
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char IsImageFigure;

  -[UICGPDFNodeAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[UICGPDFNodeAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeRef");
  if (CGPDFTaggedNodeGetType() == 700)
  {
    objc_msgSend(v5, "nodeRef");
    IsImageFigure = CGPDFTaggedNodeIsImageFigure();
  }
  else
  {
    IsImageFigure = 0;
  }

  return IsImageFigure;
}

+ (BOOL)_isValidTextFieldElement:(id)a3
{
  id v3;
  void *v4;
  int Type;
  BOOL v6;

  v3 = a3;
  if (!v3 || (MEMORY[0x234918584](CFSTR("UICGPDFNodeAccessibilityElement")), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nodeRef");
  Type = CGPDFTaggedNodeGetType();

  if (Type != 200)
  {
    if ((IsCGPDFTaggedNodeTypeHeader() & 1) == 0 && (IsCGPDFTaggedNodeTypeIllustration() & 1) == 0)
    {
      v6 = 0;
      IsCGPDFTaggedNodeTypeGroup();
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v6 = +[UICGPDFNodeAccessibilityElement _containsOnlyTextChildren:](UICGPDFNodeAccessibilityElement, "_containsOnlyTextChildren:", objc_msgSend(v3, "nodeRef"));
LABEL_8:

  return v6;
}

- (id)_accessibilityLinks
{
  void *v3;
  void *v4;
  void *v5;

  -[UICGPDFNodeAccessibilityElement cachedAXPDFLinks](self, "cachedAXPDFLinks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[UICGPDFNodeAccessibilityElement isAccessibilityElement](self, "isAccessibilityElement")
      && !-[UICGPDFNodeAccessibilityElement _isContainerOfOnlyOneLinkNodeChild](self, "_isContainerOfOnlyOneLinkNodeChild"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICGPDFNodeAccessibilityElement cachedAXPDFLinkNodes](self, "cachedAXPDFLinkNodes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        -[UICGPDFNodeAccessibilityElement _findLinkChildrenNodesOfNode:](self, "_findLinkChildrenNodesOfNode:", self);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICGPDFNodeAccessibilityElement setCachedAXPDFLinkNodes:](self, "setCachedAXPDFLinkNodes:", v4);
      }
      objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);
      -[UICGPDFNodeAccessibilityElement _paragraphLinksInNode:](self, "_paragraphLinksInNode:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v5);

      objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_320);
      -[UICGPDFNodeAccessibilityElement setCachedAXPDFLinks:](self, "setCachedAXPDFLinks:", v3);

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

uint64_t __54__UICGPDFNodeAccessibilityElement__accessibilityLinks__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccessibilityTraits:", *MEMORY[0x24BDF73D8]);
}

- (BOOL)_isContainerOfOnlyOneLinkNodeChild
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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

  -[UICGPDFNodeAccessibilityElement nodeRef](self, "nodeRef");
  if (CGPDFTaggedNodeGetType() == 506)
    return 1;
  -[UICGPDFNodeAccessibilityElement cachedAXPDFLinkNodes](self, "cachedAXPDFLinkNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[UICGPDFNodeAccessibilityElement _findLinkChildrenNodesOfNode:](self, "_findLinkChildrenNodesOfNode:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICGPDFNodeAccessibilityElement setCachedAXPDFLinkNodes:](self, "setCachedAXPDFLinkNodes:", v4);
  }
  if (objc_msgSend(v4, "count") == 1)
  {
    -[UICGPDFNodeAccessibilityElement accessibilityLabel](self, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectAtIndex:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v8) = objc_msgSend(v7, "isEqualToString:", v11);
    if ((v8 & 1) != 0)
      return 1;
  }
  else
  {

  }
  -[UICGPDFNodeAccessibilityElement _paragraphLinksInNode:](self, "_paragraphLinksInNode:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == 1)
  {
    -[UICGPDFNodeAccessibilityElement accessibilityLabel](self, "accessibilityLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectAtIndex:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accessibilityLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(v15, "isEqualToString:", v19);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_pdfElementHasLinkContainer
{
  void *v2;
  BOOL v3;

  -[UICGPDFNodeAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "nodeRef");
    if (CGPDFTaggedNodeGetType() == 506)
      v3 = 1;
  }

  return v3;
}

- (id)_paragraphLinksInNode:(id)a3
{
  id v3;
  void *v4;
  CFIndex i;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  void *v26;
  float v27;
  double v28;
  void *v29;
  void *v30;
  float v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CFIndex Count;
  const __CFArray *theArray;
  _QWORD v40[8];

  v3 = a3;
  objc_msgSend(v3, "cachedAXPDFOtherLinks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "nodeRef"))
    {
      if (CGPDFTaggedNodeGetType() != 506)
      {
        theArray = (const __CFArray *)CGPDFTaggedNodeGetParagraphLinks();
        if (theArray)
        {
          Count = CFArrayGetCount(theArray);
          if (Count >= 1)
          {
            for (i = 0; i != Count; ++i)
            {
              CFArrayGetValueAtIndex(theArray, i);
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBADF0]), "initWithAccessibilityContainer:", v3);
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RangeLength"));
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = objc_msgSend(v8, "intValue");
              v10 = v9;

              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RangeLocation"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = (int)objc_msgSend(v11, "intValue");

              objc_msgSend(v3, "accessibilityLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (v9 && v12 + v9 <= (unint64_t)objc_msgSend(v13, "length"))
              {
                objc_msgSend(v14, "substringWithRange:", v12, v9);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setAccessibilityLabel:", v15);

                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("URI"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setAccessibilityIdentifier:", v16);

              }
              objc_msgSend(v7, "setRange:", v12, v10, Count);
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Rect"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Height"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "floatValue");
              v20 = v19;

              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Rect"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Width"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "floatValue");
              v24 = v23;

              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Rect"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("X"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "floatValue");
              v28 = v27;

              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Rect"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Y"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "floatValue");
              v32 = v31;

              objc_msgSend(v3, "axConvertBoundsFromPageToScreenCoordinates:", v28, v32, v24, v20);
              v40[0] = MEMORY[0x24BDAC760];
              v40[1] = 3221225472;
              v40[2] = __57__UICGPDFNodeAccessibilityElement__paragraphLinksInNode___block_invoke;
              v40[3] = &__block_descriptor_64_e36__CGRect__CGPoint_dd__CGSize_dd__8__0l;
              v40[4] = v33;
              v40[5] = v34;
              v40[6] = v35;
              v40[7] = v36;
              objc_msgSend(v7, "_setAccessibilityFrameBlock:", v40);
              objc_msgSend(v4, "addObject:", v7);

            }
          }
        }
      }
    }
    objc_msgSend(v3, "setCachedAXPDFOtherLinks:", v4, Count);
  }

  return v4;
}

double __57__UICGPDFNodeAccessibilityElement__paragraphLinksInNode___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (id)_findLinkChildrenNodesOfNode:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "nodeRef");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && CGPDFTaggedNodeGetType() == 506)
  {
    objc_msgSend(v6, "axSafelyAddObject:", v4);
  }
  else
  {
    objc_msgSend(v4, "accessibilityElements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[UICGPDFNodeAccessibilityElement _findLinkChildrenNodesOfNode:](self, "_findLinkChildrenNodesOfNode:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "axSafelyAddObjectsFromArray:", v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  return v6;
}

- (id)_findCaptionChildrenNodesOfFigureNode:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "nodeRef", (_QWORD)v12);
          if (CGPDFTaggedNodeGetType() == 106)
            objc_msgSend(v4, "axSafelyAddObject:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_findFigureChildrenNodesOfTableCellNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "nodeRef");
  if (CGPDFTaggedNodeGetType() == 700 && objc_msgSend(v4, "isAccessibilityElement"))
  {
    v20[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "accessibilityElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[UICGPDFNodeAccessibilityElement _findFigureChildrenNodesOfTableCellNode:](self, "_findFigureChildrenNodesOfTableCellNode:", v12, (_QWORD)v15);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  return v5;
}

- (id)_findTableCellNodesOfTableNode:(id)a3 withHeadersOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int Type;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  id v25;
  _QWORD v26[3];

  v4 = a4;
  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "nodeRef");
  Type = CGPDFTaggedNodeGetType();
  if (v4)
  {
    if (Type == 402)
    {
      v26[0] = v6;
      v8 = (void *)MEMORY[0x24BDBCE30];
      v9 = (id *)v26;
LABEL_7:
      objc_msgSend(v8, "arrayWithObjects:count:", v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  else if (Type == 402 || (objc_msgSend(v6, "nodeRef"), CGPDFTaggedNodeGetType() == 403))
  {
    v25 = v6;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = &v25;
    goto LABEL_7;
  }
  objc_msgSend(v6, "accessibilityElements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[UICGPDFNodeAccessibilityElement _findTableCellNodesOfTableNode:withHeadersOnly:](self, "_findTableCellNodesOfTableNode:withHeadersOnly:", v17, v4, (_QWORD)v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "axSafelyAddObjectsFromArray:", v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

LABEL_18:
  return v10;
}

- (id)_findLabelChildNodeOfListItem:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "accessibilityElements");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "nodeRef", (_QWORD)v9);
          if (CGPDFTaggedNodeGetType() == 302)
          {
            v4 = v7;
            goto LABEL_12;
          }
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)_findTOCIChildNodeOfNode:(id)a3
{
  UICGPDFNodeAccessibilityElement *v4;
  UICGPDFNodeAccessibilityElement *v5;
  UICGPDFNodeAccessibilityElement *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (UICGPDFNodeAccessibilityElement *)a3;
  v5 = v4;
  if (v4 == self
    || (-[UICGPDFNodeAccessibilityElement nodeRef](v4, "nodeRef"), CGPDFTaggedNodeGetType() != 108))
  {
    -[UICGPDFNodeAccessibilityElement accessibilityElements](v5, "accessibilityElements");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[UICGPDFNodeAccessibilityElement _findTOCIChildNodeOfNode:](self, "_findTOCIChildNodeOfNode:", v12, (_QWORD)v15);
            v13 = objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v6 = (UICGPDFNodeAccessibilityElement *)v13;
              goto LABEL_15;
            }
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_15:

  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (unint64_t)_findTraitsForTableCellElements
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UICGPDFNodeAccessibilityElement;
  v3 = -[UICGPDFNodeAccessibilityElement accessibilityTraits](&v10, sel_accessibilityTraits);
  -[UICGPDFNodeAccessibilityElement cachedAXFigureChildrenNodesOfTableCellNode](self, "cachedAXFigureChildrenNodesOfTableCellNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[UICGPDFNodeAccessibilityElement _findFigureChildrenNodesOfTableCellNode:](self, "_findFigureChildrenNodesOfTableCellNode:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    -[UICGPDFNodeAccessibilityElement setCachedAXFigureChildrenNodesOfTableCellNode:](self, "setCachedAXFigureChildrenNodesOfTableCellNode:", v5);

  }
  v6 = objc_msgSend(v4, "count");
  v7 = *MEMORY[0x24BDF73C8];
  if (!v6)
    v7 = 0;
  v8 = v7 | v3;

  return v8;
}

+ (void)buildPDFAnnotationNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v5, "annotations", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_addPDFAnnotation:toPDFAccessibilityNode:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

+ (void)_addPDFAnnotation:(id)a3 toPDFAccessibilityNode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  PDFAnnotationAccessibilityElement *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "page");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "page");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {
    v33 = 0;
    v34 = (double *)&v33;
    v35 = 0x4010000000;
    v36 = &unk_232882249;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v5, "bounds");
    *(_QWORD *)&v37 = v9;
    *((_QWORD *)&v37 + 1) = v10;
    *(_QWORD *)&v38 = v11;
    *((_QWORD *)&v38 + 1) = v12;
    v30[1] = MEMORY[0x24BDAC760];
    v30[2] = 3221225472;
    v30[3] = __76__UICGPDFNodeAccessibilityElement__addPDFAnnotation_toPDFAccessibilityNode___block_invoke;
    v30[4] = &unk_2502DF070;
    v32 = &v33;
    v13 = v6;
    v31 = v13;
    AXPerformSafeBlock();
    v29 = 0;
    v30[0] = 0x7FEFFFFFFFFFFFFFLL;
    v28 = 0;
    +[UICGPDFNodeAccessibilityElement _findClosestLineNodeForBounds:withRootNode:withDistanceBetterThan:parentFound:siblingFound:](UICGPDFNodeAccessibilityElement, "_findClosestLineNodeForBounds:withRootNode:withDistanceBetterThan:parentFound:siblingFound:", v13, v30, &v29, &v28, v34[4], v34[5], v34[6], v34[7]);
    v14 = v29;
    v15 = v28;
    v16 = v15;
    if (!v14 || !v15)
      goto LABEL_15;
    v17 = +[UICGPDFNodeAccessibilityElement _isValidTextFieldElement:](UICGPDFNodeAccessibilityElement, "_isValidTextFieldElement:", v14);
    if (v17)
    {
      objc_msgSend(v14, "accessibilityContainer");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
LABEL_15:

        _Block_object_dispose(&v33, 8);
        goto LABEL_16;
      }
    }
    else
    {
      v18 = v14;
    }
    v27 = v18;
    v19 = [PDFAnnotationAccessibilityElement alloc];
    objc_msgSend(v13, "page");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PDFAnnotationAccessibilityElement initWithPage:annotation:withParent:](v19, "initWithPage:annotation:withParent:", v20, v5, v27);

    objc_msgSend(v27, "accessibilityElements");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    if (v17)
    {
      v23 = objc_msgSend(v22, "indexOfObject:", v14);
    }
    else
    {
      v23 = objc_msgSend(v22, "indexOfObject:", v16);
      while (v23 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v16, "accessibilityContainer");
        v24 = objc_claimAutoreleasedReturnValue();

        v23 = objc_msgSend(v22, "indexOfObject:", v24);
        v16 = (void *)v24;
      }
    }
    if (v23 <= objc_msgSend(v22, "count", v25))
      objc_msgSend(v22, "insertObject:atIndex:", v26, v23 + 1);
    objc_msgSend(v22, "sortUsingSelector:", sel_accessibilityCompareGeometry_);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v27, "setCachedAXElements:", v22);
    objc_msgSend(v27, "setAccessibilityElements:", v22);

    goto LABEL_15;
  }
LABEL_16:

}

void __76__UICGPDFNodeAccessibilityElement__addPDFAnnotation_toPDFAccessibilityNode___block_invoke(uint64_t a1)
{
  double *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "pdfView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  objc_msgSend(*(id *)(a1 + 32), "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:fromPage:", v3, v2[4], v2[5], v2[6], v2[7]);
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;

}

+ (void)_findClosestLineNodeForBounds:(CGRect)a3 withRootNode:(id)a4 withDistanceBetterThan:(double *)a5 parentFound:(id *)a6 siblingFound:(id *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double MinY;
  double v25;
  double MaxX;
  double v27;
  double v28;
  double MidY;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double MinX;
  double v35;
  BOOL v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  double MaxY;
  CGFloat v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  CGRect v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat rect;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v65 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend(v14, "accessibilityElements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v61;
    v56.size.width = width;
    v56.size.height = height;
    v56.origin.x = x;
    v56.origin.y = y;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v61 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && +[UICGPDFNodeAccessibilityElement _isValidTextFieldElement:](UICGPDFNodeAccessibilityElement, "_isValidTextFieldElement:", v20))
        {
          objc_msgSend(v20, "accessibilityFrame");
          v21 = v66.origin.x;
          v22 = v66.size.width;
          v23 = v66.size.height;
          rect = v66.origin.y;
          MinY = CGRectGetMinY(v66);
          v67.origin.x = x;
          v67.origin.y = y;
          v67.size.width = width;
          v67.size.height = height;
          v57 = v22;
          v58 = v23;
          if (MinY >= CGRectGetMaxY(v67))
            goto LABEL_12;
          v68.origin.x = x;
          v68.origin.y = y;
          v68.size.width = width;
          v68.size.height = height;
          v25 = CGRectGetMinY(v68);
          v69.origin.x = v21;
          v69.origin.y = rect;
          v69.size.width = v22;
          v69.size.height = v23;
          if (v25 >= CGRectGetMaxY(v69))
          {
LABEL_12:
            v75.origin.x = v21;
            v75.origin.y = rect;
            v75.size.width = v22;
            v75.size.height = v23;
            MinX = CGRectGetMinX(v75);
            v76.origin.x = x;
            v76.origin.y = y;
            v76.size.width = width;
            v76.size.height = height;
            v35 = -1.0;
            v36 = MinX < CGRectGetMaxX(v76);
            v37 = -1.0;
            v28 = -1.0;
            MidY = -1.0;
            if (!v36)
              goto LABEL_24;
            v77.origin.x = v21;
            v77.size.height = v58;
            v77.origin.y = rect;
            v77.size.width = v57;
            v38 = CGRectGetMinY(v77);
            v40 = v56.origin.x;
            v39 = v56.origin.y;
            v42 = v56.size.width;
            v41 = v56.size.height;
            if (v38 >= CGRectGetMinY(v56)
              || (v78.origin.x = v21,
                  v78.size.height = v58,
                  v78.origin.y = rect,
                  v78.size.width = v57,
                  v43 = CGRectGetMaxY(v78),
                  v43 >= CGRectGetMaxY(v56)))
            {
              v46 = CGRectGetMinY(v56);
              v79.origin.x = v21;
              v79.size.height = v58;
              v79.origin.y = rect;
              v79.size.width = v57;
              v35 = -1.0;
              v36 = v46 < CGRectGetMinY(v79);
              v37 = -1.0;
              v28 = -1.0;
              MidY = -1.0;
              if (!v36)
                goto LABEL_24;
              MaxY = CGRectGetMaxY(v56);
              v80.origin.x = v21;
              v80.size.height = v58;
              v80.origin.y = rect;
              v80.size.width = v57;
              v36 = MaxY < CGRectGetMaxY(v80);
              v37 = -1.0;
              v28 = -1.0;
              if (!v36)
                goto LABEL_24;
              v40 = v56.origin.x;
              v39 = v56.origin.y;
              v44 = v56.origin.x;
              v45 = v56.origin.y;
              v42 = v56.size.width;
              v41 = v56.size.height;
            }
            else
            {
              v44 = v56.origin.x;
              v45 = v56.origin.y;
            }
            v48 = v42;
            v49 = v41;
            v28 = CGRectGetMinX(*(CGRect *)&v44);
            v81.origin.x = v40;
            v81.origin.y = v39;
            v81.size.width = v42;
            v81.size.height = v41;
            MidY = CGRectGetMidY(v81);
            v82.origin.x = v21;
            v30 = v58;
            v31 = rect;
            v82.origin.y = rect;
            v32 = v57;
            v82.size.width = v57;
            v82.size.height = v58;
            v33 = CGRectGetMinX(v82);
LABEL_23:
            v35 = v33;
            v83.origin.x = v21;
            v83.origin.y = v31;
            v83.size.width = v32;
            v83.size.height = v30;
            v37 = CGRectGetMidY(v83);
          }
          else
          {
            v70.origin.x = v21;
            v70.origin.y = rect;
            v70.size.width = v22;
            v70.size.height = v23;
            MaxX = CGRectGetMaxX(v70);
            v71.origin.x = x;
            v71.origin.y = y;
            v71.size.width = width;
            v71.size.height = height;
            v27 = CGRectGetMinX(v71);
            v72.origin.x = x;
            v72.origin.y = y;
            v72.size.width = width;
            v72.size.height = height;
            v28 = CGRectGetMinX(v72);
            if (MaxX < v27)
            {
              v73.origin.x = x;
              v73.origin.y = y;
              v73.size.width = width;
              v73.size.height = height;
              MidY = CGRectGetMidY(v73);
              v74.origin.x = v21;
              v30 = v58;
              v31 = rect;
              v74.origin.y = rect;
              v32 = v57;
              v74.size.width = v57;
              v74.size.height = v58;
              v33 = CGRectGetMaxX(v74);
              goto LABEL_23;
            }
            v84.origin.x = v21;
            v84.size.height = v58;
            v84.origin.y = rect;
            v84.size.width = v57;
            v35 = -1.0;
            v36 = v28 < CGRectGetMinX(v84);
            v37 = -1.0;
            v28 = -1.0;
            MidY = -1.0;
            if (v36)
            {
              AX_CGRectGetCenter();
              v28 = v51;
              MidY = v52;
              AX_CGRectGetCenter();
              v35 = v53;
              v37 = v54;
            }
          }
LABEL_24:
          width = v56.size.width;
          height = v56.size.height;
          x = v56.origin.x;
          y = v56.origin.y;
          if (v28 != -1.0)
          {
            v50 = vabdd_f64(v28, v35) + vabdd_f64(MidY, v37);
            if (v50 > 0.0 && v50 < *a5)
            {
              *a5 = v50;
              *a6 = objc_retainAutorelease(v14);
              *a7 = objc_retainAutorelease(v20);
            }
          }
        }
        +[UICGPDFNodeAccessibilityElement _findClosestLineNodeForBounds:withRootNode:withDistanceBetterThan:parentFound:siblingFound:](UICGPDFNodeAccessibilityElement, "_findClosestLineNodeForBounds:withRootNode:withDistanceBetterThan:parentFound:siblingFound:", v20, a5, a6, a7, x, y, width, height);
        ++v19;
      }
      while (v17 != v19);
      v55 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      v17 = v55;
    }
    while (v55);
  }

}

- (CGPDFTaggedNode)nodeRef
{
  return self->_nodeRef;
}

- (void)setNodeRef:(CGPDFTaggedNode *)a3
{
  self->_nodeRef = a3;
}

- (NSMutableArray)cachedAXElements
{
  return self->_cachedAXElements;
}

- (void)setCachedAXElements:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAXElements, a3);
}

- (NSMutableArray)cachedAXPDFLinks
{
  return self->_cachedAXPDFLinks;
}

- (void)setCachedAXPDFLinks:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAXPDFLinks, a3);
}

- (NSMutableArray)cachedAXPDFOtherLinks
{
  return self->_cachedAXPDFOtherLinks;
}

- (void)setCachedAXPDFOtherLinks:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAXPDFOtherLinks, a3);
}

- (NSMutableArray)cachedAXPDFLinkNodes
{
  return self->_cachedAXPDFLinkNodes;
}

- (void)setCachedAXPDFLinkNodes:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAXPDFLinkNodes, a3);
}

- (NSMutableArray)cachedAXPDFTableCellNodes
{
  return self->_cachedAXPDFTableCellNodes;
}

- (void)setCachedAXPDFTableCellNodes:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAXPDFTableCellNodes, a3);
}

- (NSMutableArray)cachedAXFigureChildrenNodesOfTableCellNode
{
  return self->_cachedAXFigureChildrenNodesOfTableCellNode;
}

- (void)setCachedAXFigureChildrenNodesOfTableCellNode:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAXFigureChildrenNodesOfTableCellNode, a3);
}

- (NSMutableArray)cachedAXCaptionChildrenNodesOfFigureNode
{
  return self->_cachedAXCaptionChildrenNodesOfFigureNode;
}

- (void)setCachedAXCaptionChildrenNodesOfFigureNode:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAXCaptionChildrenNodesOfFigureNode, a3);
}

- (int64_t)listItemNumber
{
  return self->_listItemNumber;
}

- (void)setListItemNumber:(int64_t)a3
{
  self->_listItemNumber = a3;
}

- (NSString)listStyle
{
  return self->_listStyle;
}

- (void)setListStyle:(id)a3
{
  objc_storeStrong((id *)&self->_listStyle, a3);
}

- (NSString)altText
{
  return self->_altText;
}

- (void)setAltText:(id)a3
{
  objc_storeStrong((id *)&self->_altText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altText, 0);
  objc_storeStrong((id *)&self->_listStyle, 0);
  objc_storeStrong((id *)&self->_cachedAXCaptionChildrenNodesOfFigureNode, 0);
  objc_storeStrong((id *)&self->_cachedAXFigureChildrenNodesOfTableCellNode, 0);
  objc_storeStrong((id *)&self->_cachedAXPDFTableCellNodes, 0);
  objc_storeStrong((id *)&self->_cachedAXPDFLinkNodes, 0);
  objc_storeStrong((id *)&self->_cachedAXPDFOtherLinks, 0);
  objc_storeStrong((id *)&self->_cachedAXPDFLinks, 0);
  objc_storeStrong((id *)&self->_cachedAXElements, 0);
}

@end
