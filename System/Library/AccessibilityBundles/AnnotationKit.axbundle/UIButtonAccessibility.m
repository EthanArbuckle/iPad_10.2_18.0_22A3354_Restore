@implementation UIButtonAccessibility

void __65__UIButtonAccessibility__AnnotationKit__UIKit_accessibilityLabel__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "customView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "tag");
    *a4 = 1;
  }

}

@end
