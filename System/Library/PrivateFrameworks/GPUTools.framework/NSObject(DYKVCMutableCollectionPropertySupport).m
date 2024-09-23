@implementation NSObject(DYKVCMutableCollectionPropertySupport)

+ (id)_dy_mutableCollectionPropertyInfo
{
  return +[_DYNSKVCMutableCollectionPropertyInfo mutableCollectionPropertyInfoForClass:](_DYNSKVCMutableCollectionPropertyInfo, "mutableCollectionPropertyInfoForClass:", objc_opt_class());
}

- (id)_dy_mutableCollectionPropertyInfo
{
  return +[_DYNSKVCMutableCollectionPropertyInfo mutableCollectionPropertyInfoForClass:](_DYNSKVCMutableCollectionPropertyInfo, "mutableCollectionPropertyInfoForClass:", objc_opt_class());
}

+ (uint64_t)dy_synthesizeMutableArrayProperty:()DYKVCMutableCollectionPropertySupport withInstanceVariable:
{
  return objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "dy_synthesizeMutableArrayProperty:withInstanceVariable:", a3, a4);
}

+ (uint64_t)dy_synthesizeMutableSetProperty:()DYKVCMutableCollectionPropertySupport withInstanceVariable:
{
  return objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "dy_synthesizeMutableSetProperty:withInstanceVariable:", a3, a4);
}

- (uint64_t)dy_mutableArrayPrimitiveGetMutableValueForProperty:()DYKVCMutableCollectionPropertySupport
{
  return objc_msgSend(a1, "mutableArrayValueForKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a3), "key"));
}

- (uint64_t)dy_mutableArrayPrimitiveGetValueForProperty:()DYKVCMutableCollectionPropertySupport
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a3), "underlyingIvarValueForObject:", a1);
}

- (uint64_t)dy_mutableArrayPrimitiveSetValue:()DYKVCMutableCollectionPropertySupport forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a4), "underlyingIvarValueForObject:", a1), "setArray:", a3);
}

- (uint64_t)dy_mutableArrayPrimitiveInsertObject:()DYKVCMutableCollectionPropertySupport atIndex:forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a5), "underlyingIvarValueForObject:", a1), "insertObject:atIndex:", a3, a4);
}

- (uint64_t)dy_mutableArrayPrimitiveRemoveObjectAtIndex:()DYKVCMutableCollectionPropertySupport forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a4), "underlyingIvarValueForObject:", a1), "removeObjectAtIndex:", a3);
}

- (uint64_t)dy_mutableArrayPrimitiveReplaceObjectAtIndex:()DYKVCMutableCollectionPropertySupport withObject:forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a5), "underlyingIvarValueForObject:", a1), "replaceObjectAtIndex:withObject:", a3, a4);
}

- (uint64_t)dy_mutableArrayPrimitiveInsertObjects:()DYKVCMutableCollectionPropertySupport atIndexes:forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a5), "underlyingIvarValueForObject:", a1), "insertObjects:atIndexes:", a3, a4);
}

- (uint64_t)dy_mutableArrayPrimitiveRemoveObjectsAtIndexes:()DYKVCMutableCollectionPropertySupport forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a4), "underlyingIvarValueForObject:", a1), "removeObjectsAtIndexes:", a3);
}

- (uint64_t)dy_mutableArrayPrimitiveReplaceObjectsAtIndexes:()DYKVCMutableCollectionPropertySupport withObjects:forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a5), "underlyingIvarValueForObject:", a1), "replaceObjectsAtIndexes:withObjects:", a3, a4);
}

- (uint64_t)dy_mutableArrayPrimitiveCountForProperty:()DYKVCMutableCollectionPropertySupport
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a3), "underlyingIvarValueForObject:", a1), "count");
}

- (uint64_t)dy_mutableArrayPrimitiveObjectAtIndex:()DYKVCMutableCollectionPropertySupport forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a4), "underlyingIvarValueForObject:", a1), "objectAtIndex:", a3);
}

- (uint64_t)dy_mutableArrayPrimitiveObjectsAtIndexes:()DYKVCMutableCollectionPropertySupport forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a4), "underlyingIvarValueForObject:", a1), "objectsAtIndexes:", a3);
}

- (uint64_t)dy_mutableArrayPrimitiveGetObjects:()DYKVCMutableCollectionPropertySupport range:forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a6), "underlyingIvarValueForObject:", a1), "getObjects:range:", a3, a4, a5);
}

- (uint64_t)dy_mutableSetPrimitiveGetMutableValueForProperty:()DYKVCMutableCollectionPropertySupport
{
  return objc_msgSend(a1, "mutableSetValueForKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a3), "key"));
}

- (uint64_t)dy_mutableSetPrimitiveGetValueForProperty:()DYKVCMutableCollectionPropertySupport
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a3), "underlyingIvarValueForObject:", a1);
}

- (uint64_t)dy_mutableSetPrimitiveSetValue:()DYKVCMutableCollectionPropertySupport forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a4), "underlyingIvarValueForObject:", a1), "setSet:", a3);
}

- (uint64_t)dy_mutableSetPrimitiveAddObject:()DYKVCMutableCollectionPropertySupport forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a4), "underlyingIvarValueForObject:", a1), "addObject:", a3);
}

- (uint64_t)dy_mutableSetPrimitiveRemoveObject:()DYKVCMutableCollectionPropertySupport forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a4), "underlyingIvarValueForObject:", a1), "removeObject:", a3);
}

- (uint64_t)dy_mutableSetPrimitiveAddObjects:()DYKVCMutableCollectionPropertySupport forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a4), "underlyingIvarValueForObject:", a1), "unionSet:", a3);
}

- (uint64_t)dy_mutableSetPrimitiveRemoveObjects:()DYKVCMutableCollectionPropertySupport forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a4), "underlyingIvarValueForObject:", a1), "minusSet:", a3);
}

- (uint64_t)dy_mutableSetPrimitiveIntersectObjects:()DYKVCMutableCollectionPropertySupport forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a4), "underlyingIvarValueForObject:", a1), "intersectSet:", a3);
}

- (uint64_t)dy_mutableSetPrimitiveCountForProperty:()DYKVCMutableCollectionPropertySupport
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a3), "underlyingIvarValueForObject:", a1), "count");
}

- (uint64_t)dy_mutableSetPrimitiveObjectEnumeratorForProperty:()DYKVCMutableCollectionPropertySupport
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a3), "underlyingIvarValueForObject:", a1), "objectEnumerator");
}

- (uint64_t)dy_mutableSetPrimitiveMember:()DYKVCMutableCollectionPropertySupport forProperty:
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_dy_mutableCollectionPropertyInfo"), "bindingForProperty:", a4), "underlyingIvarValueForObject:", a1), "member:", a3);
}

@end
