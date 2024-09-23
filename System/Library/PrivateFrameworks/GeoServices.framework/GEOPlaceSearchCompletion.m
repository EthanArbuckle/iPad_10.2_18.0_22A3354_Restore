@implementation GEOPlaceSearchCompletion

void __74___GEOPlaceSearchCompletion_initWithResponse_traits_sessionData_mapItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "resultType") == 2 && objc_msgSend(v5, "hasCollection"))
  {
    v3 = v5;
    v4 = (id *)(a1 + 32);
LABEL_7:
    objc_msgSend(*v4, "addObject:", v3);
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "resultType") == 3 && objc_msgSend(v5, "hasPublisher"))
  {
    v3 = v5;
    v4 = (id *)(a1 + 40);
    goto LABEL_7;
  }
LABEL_8:

}

@end
