@implementation ZN15SVGAttributeMapC2ERKS

uint64_t **___ZN15SVGAttributeMapC2ERKS__block_invoke(uint64_t a1, int a2, const SVGAttribute *a3)
{
  uint64_t v5;
  SVGAttribute *v6;
  __int128 v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (SVGAttribute *)operator new();
  SVGAttribute::SVGAttribute(v6, a3);
  LODWORD(v8) = a2;
  *((_QWORD *)&v8 + 1) = v6;
  return std::__tree<std::__value_type<SVGAtom::Name,SVGAttribute *>,std::__map_value_compare<SVGAtom::Name,std::__value_type<SVGAtom::Name,SVGAttribute *>,std::less<SVGAtom::Name>,true>,std::allocator<std::__value_type<SVGAtom::Name,SVGAttribute *>>>::__emplace_unique_key_args<SVGAtom::Name,std::pair<SVGAtom::Name const,SVGAttribute *>>((uint64_t **)(v5 + 48), (unsigned int *)&v8, &v8);
}

@end
