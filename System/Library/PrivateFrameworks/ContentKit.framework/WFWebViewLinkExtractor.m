@implementation WFWebViewLinkExtractor

+ (void)extractLinksFromWKWebView:(id)a3 withDestinationWidth:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  double v15;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "linkPositionRetrievalJavaScript");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__WFWebViewLinkExtractor_extractLinksFromWKWebView_withDestinationWidth_completionHandler___block_invoke;
  v12[3] = &unk_24C4DB678;
  v15 = a4;
  v13 = v8;
  v14 = a1;
  v11 = v8;
  objc_msgSend(v9, "evaluateJavaScript:completionHandler:", v10, v12);

}

+ (void)extractLinksFromScriptResult:(id)a3 withDestinationWidth:(double)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  void *v17;
  _QWORD v18[5];

  v7 = a3;
  v8 = (void (**)(id, void *))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x24BDD1608];
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "JSONObjectWithData:options:error:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKey:", CFSTR("pageMetrics"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("links"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("width"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = a4 / v15;

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __94__WFWebViewLinkExtractor_extractLinksFromScriptResult_withDestinationWidth_completionHandler___block_invoke;
    v18[3] = &__block_descriptor_40_e25__24__0__NSDictionary_8Q16l;
    *(double *)&v18[4] = v16;
    objc_msgSend(v13, "if_compactMap:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v17);

  }
  else
  {
    v8[2](v8, 0);
  }

}

+ (id)linkPositionRetrievalJavaScript
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", "function getMetricsDictionaryFromRect(rect) { return {'x': rect.left, 'y': rect.top, 'width': rect.width, 'height': rect.height}; } var measuringStick = d"
                                           "ocument.createElement('a'); measuringStick.href = 'http://prevueguide.com'; m"
                                           "easuringStick.style.cssText = 'height: 100%; width: 100%; float: left'; docum"
                                           "ent.body.appendChild(measuringStick); var pageMetrics = getMetricsDictionaryF"
                                           "romRect(measuringStick.getBoundingClientRect()); document.body.removeChild(me"
                                           "asuringStick); var links = document.getElementsByTagName('a'); var linkDictio"
                                           "naries = []; for (var i = 0; i < links.length; ++i) { var link = links[i]; va"
                                           "r rect = link.getBoundingClientRect(); if (link.href && rect.width && rect.he"
                                           "ight) { var linkDictionary = getMetricsDictionaryFromRect(rect); linkDictiona"
                                           "ry['href'] = link.href; linkDictionaries.push(linkDictionary); } } JSON.strin"
                                           "gify({'pageMetrics': pageMetrics, 'links':linkDictionaries});",
                                           4));
}

WFWebViewLink *__94__WFWebViewLinkExtractor_extractLinksFromScriptResult_withDestinationWidth_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  float v5;
  CGFloat v6;
  void *v7;
  float v8;
  CGFloat v9;
  void *v10;
  float v11;
  CGFloat v12;
  void *v13;
  float v14;
  CGFloat v15;
  double x;
  double y;
  double width;
  double height;
  void *v20;
  void *v21;
  WFWebViewLink *v22;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("width"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  objc_msgSend(v3, "objectForKey:", CFSTR("height"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v3, "objectForKey:", CFSTR("x"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  objc_msgSend(v3, "objectForKey:", CFSTR("y"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  CGAffineTransformMakeScale(&v24, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 32));
  v25.origin.x = v12;
  v25.origin.y = v15;
  v25.size.width = v6;
  v25.size.height = v9;
  v26 = CGRectApplyAffineTransform(v25, &v24);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  objc_msgSend(v3, "objectForKey:", CFSTR("href"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    v22 = -[WFWebViewLink initWithHref:rect:]([WFWebViewLink alloc], "initWithHref:rect:", v21, x, y, width, height);
  else
    v22 = 0;

  return v22;
}

uint64_t __91__WFWebViewLinkExtractor_extractLinksFromWKWebView_withDestinationWidth_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "extractLinksFromScriptResult:withDestinationWidth:completionHandler:", a2, *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
}

@end
