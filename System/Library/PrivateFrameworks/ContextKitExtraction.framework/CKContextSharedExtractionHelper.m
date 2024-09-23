@implementation CKContextSharedExtractionHelper

+ (id)webPageNodeExtractionJavaScript
{
  return CFSTR("let traversed=null;function retrieveNodeInformation(){traversed=new Set;let e,t=document.createNodeIterator(document.body,NodeFilter.SHOW_ELEMENT),n=[];for (;e=t.nextNode();){if (traversed.has(e))continue;let t=elementBoundingBoxInPage(e),o=t.height>10&&t.width>30,i=elementIsVisibleInViewport(e);if (!o||elementIsHidden(e))continue;let r=[].map.call(e.childNodes,(function(e){return nodeText='',3==e.nodeType?nodeText=e.nodeValue.trim():['A', 'B', 'L', 'U', 'LI'].indexOf(e.nodeName)>=0&&(traversed.add(e),nodeText=e.innerText.trim()),nodeText||void 0})).filter((e=>null!=e)).join(', ').trim(),[d,l]=shouldGetAllText(e);d&&(r=getAllText(e).join(', ').trim());let s=elementOriginPagesFromViewport(t),w=/^(.)\x01+$/.test(r);r.length>=3&&r.length<350&&!w&&(node={text:r,className:l,left:t.left,right:t.right,top:t.top,bottom:t.bottom,onScreen:i?1:0,pagesFromViewport:s},n.push(node),n.length>250&&(n[0].pagesFromViewPort>node.pagesFromViewPort?n.shift():n.pop()))}return traversed=null,JSON.stringify({nodes:n})}function shouldGetAllText(e){const t=e.getAttribute('itemtype');if (t&&t.includes('schema.org/'))return[!0,t];const n=e.nodeName;return n&&['address'].includes(n.toString().toLowerCase())?[!0,n]:[!1,null]}function getAllText(e){return traversed.add(e),[].flatMap.call(e.childNodes,(function(e){if (e.nodeType!=Node.ELEMENT_NODE||!elementIsHidden(e)){if (e.nodeType==Node.TEXT_NODE){let t=e.nodeValue.trim();return t||void 0}return getAllText(e)}})).filter((e=>!['|',',',void 0].includes(e)))}function elementBoundingBoxInPage(e){let t=e.getBoundingClientRect();return{left:t.left+window.scrollX,right:t.right+window.scrollX,top:t.top+window.scrollY,bottom:t.bottom+window.scrollY,width:t.width,height:t.height}}function elementIsVisibleInViewport(e){const t=e.getBoundingClientRect();if (!(t.top<window.innerHeight&&t.left<window.innerWidth&&t.bottom>0&&t.right>0))return!1;const n={x:t.left+t.width/2,y:t.top+t.height/2};let o=e,i=document.elementFromPoint(n.x,n.y);if (null==i)return!1;do{if (i===o)return!0}while (o=o.parentNode);do{if (i===e)return!0}while (i=i.parentNode);return!1}function elementIsHidden(e){const t=window.getComputedStyle(e);return'none'===t.display||'visible'!==t.visibility||'0'===t.opacity}function elementOriginPagesFromViewport(e){let t=0,n=0;return e.top<window.pageYOffset?t=window.pageYOffset-e.top:e.top>window.pageYOffset+window.innerHeight&&(t=e.top-window.pageYOffset-window.innerHeight),e.left<window.pageXOffset?n=window.pageXOffset-e.left:e.left>window.pageXOffset+window.innerWidth&&(n=e.left-window.pageXOffset-window.innerWidth),t=Math.floor(t/window.innerHeight),n=Math.floor(n/window.innerWidth),Math.max(t,n)}retrieveNodeInformation();");
}

+ (id)blocksFromText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    if (blockCleanUpRegularExpression_once != -1)
      dispatch_once(&blockCleanUpRegularExpression_once, &__block_literal_global);
    v7 = (id)blockCleanUpRegularExpression_regex;
    objc_msgSend(v7, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, objc_msgSend(v6, "length"), CFSTR("\n\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("\n\n"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)textBlockLooksLikeAListWithText:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t j;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = objc_msgSend(&unk_1E6246EF0, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(&unk_1E6246EF0);
        objc_msgSend(v3, "componentsSeparatedByString:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)(objc_msgSend(v8, "count") - 1) >= 6)
        {
          v9 = v8;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (!v11)
          {

LABEL_23:
            v16 = 1;
            goto LABEL_24;
          }
          v12 = v11;
          v13 = 0;
          v14 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v10);
              if ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "length") > 0x54)
                ++v13;
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);

          if (!v13 || (double)v13 / (double)(unint64_t)objc_msgSend(v10, "count") < 0.25)
            goto LABEL_23;

        }
      }
      v5 = objc_msgSend(&unk_1E6246EF0, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v5)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_24:

  return v16;
}

+ (void)descendantsRelevantForContentExtractionFromView:(id)a3 intoArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_isRelevantForExtractionWithView:", v6))
  {
    objc_msgSend(v7, "addObject:", v6);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v6, "subviews", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
          if (!objc_msgSend(v6, "clipsToBounds"))
            goto LABEL_9;
          objc_msgSend(v6, "bounds");
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;
          objc_msgSend(v14, "frame");
          v34.origin.x = v23;
          v34.origin.y = v24;
          v34.size.width = v25;
          v34.size.height = v26;
          v33.origin.x = v16;
          v33.origin.y = v18;
          v33.size.width = v20;
          v33.size.height = v22;
          if (CGRectIntersectsRect(v33, v34))
LABEL_9:
            objc_msgSend(a1, "descendantsRelevantForContentExtractionFromView:intoArray:", v14, v7);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

  }
}

+ (id)bestContentStringForWebViewUIElements:(id)a3 andTitle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  float v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v13, "density");
          if (v14 > 43.0)
          {
            objc_msgSend(v13, "text");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n\n"));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v17 = &stru_1E6243B40;
      if (v16)
        v17 = v16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v6, CFSTR("\n\n"), v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v16 = (__CFString *)v18;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)_isRelevantForExtractionWithView:(id)a3
{
  id v3;
  double v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int v9;
  objc_class *v11;
  void *v12;
  CGRect v13;
  CGRect v14;

  v3 = a3;
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v3, "alpha");
  if (v4 < 0.05)
    goto LABEL_5;
  objc_msgSend(v3, "frame");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  if (CGRectGetWidth(v13) < 30.0
    || (v14.origin.x = x, v14.origin.y = y,
                          v14.size.width = width,
                          v14.size.height = height,
                          CGRectGetHeight(v14) < 17.0))
  {
LABEL_5:
    LOBYTE(v9) = 0;
  }
  else
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "isEqualToString:", CFSTR("_UIActivityContentCollectionView")) ^ 1;

  }
  return v9;
}

+ (id)bestImageForView:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  double v8;
  double v9;
  CGRect v10;
  CGRect v11;

  v3 = a3;
  objc_msgSend(v3, "frame");
  if (CGRectGetWidth(v10) < 40.0
    || (objc_msgSend(v3, "frame"), CGRectGetHeight(v11) < 40.0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "performSelector:", sel_image);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    objc_msgSend(v5, "size");
    v6 = 0;
    if (v9 >= 250.0 && v8 >= 250.0)
      v6 = v5;

  }
  return v6;
}

+ (BOOL)elementIsOnScreenWithView:(id)a3 window:(id)a4
{
  id v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  BOOL result;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "convertRect:toView:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "frame");
  v26 = v16;
  v27 = v15;

  objc_msgSend(v5, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v28.origin.x = v8;
  v28.origin.y = v10;
  v28.size.width = v12;
  v28.size.height = v14;
  v29.origin.x = v18;
  v29.origin.y = v20;
  v29.size.width = v22;
  v29.size.height = v24;
  result = CGRectIntersectsRect(v28, v29);
  if (v26 + v27 <= 0.0)
    return 0;
  return result;
}

@end
