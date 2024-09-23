@implementation _CUIExternalLinkRendition

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUIExternalLinkRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  id v6;
  char *v7;
  char *v8;
  int v9;
  unsigned int v10;
  _DWORD *v11;
  id v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_CUIExternalLinkRendition;
  v6 = -[CUIThemeRendition _initWithCSIHeader:version:](&v15, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
  *((_QWORD *)v6 + 28) = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", *((unsigned int *)v7 + 47));
  v9 = *((_DWORD *)v7 + 45);
  v8 = v7 + 180;
  if (v9 != 1163414603)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_CUIExternalLinkRendition.m"), 44, CFSTR("CoreUI: Expecting a kCSIExternalLinkSignature but didn't find it"));
  if (*((_DWORD *)v8 + 1))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_CUIExternalLinkRendition.m"), 45, CFSTR("CoreUI: CSIExternaLinkData flags must be 0 now"));
  if (*((_DWORD *)v8 + 2) != -1)
  {
    v10 = 0;
    v11 = v8 + 12;
    do
    {
      if (*v11 != 1008)
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_CUIExternalLinkRendition.m"), 48, CFSTR("CoreUI: CSIExternaLinkData numberOfAssetIdentifiers/numberExternalTags resource is of unknown type"));
      v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v11 + 2);
      v13 = v12;
      if (v10)
      {
        objc_msgSend(*((id *)v6 + 28), "addObject:", v12);

      }
      else
      {
        *((_QWORD *)v6 + 27) = v12;
      }
      v11 = (_DWORD *)((char *)v11 + v11[1] + 8);
      ++v10;
    }
    while (v10 < *((_DWORD *)v8 + 2) + 1);
  }
  return v6;
}

- (id)assetPackIdentifier
{
  return self->_assetPackIdentifier;
}

- (id)externalTags
{
  return self->_externalTags;
}

@end
