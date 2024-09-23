@implementation VKRouteContext

void __95__VKRouteContext_MKMapViewRouteContextUpdates___setRouteContextAnnotationTexts_forLegsInRoute___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6560]), "initWithEtaText:etaAdvisoryStyleAttributes:routeEtaType:", v5, 0, 3);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6568]), "initWithEtaDescription:start:end:", v6, objc_msgSend(v8, "startRouteCoordinate"), objc_msgSend(v8, "endRouteCoordinate"));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

  }
}

@end
