@implementation NSArray(NSKeyValueCodingPrivate)

- (uint64_t)_valueForKeyPath:()NSKeyValueCodingPrivate ofObjectAtIndex:
{
  return objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", a4), "valueForKeyPath:", a3);
}

- (uint64_t)_mutableArrayValueForKeyPath:()NSKeyValueCodingPrivate ofObjectAtIndex:
{
  return objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", a4), "mutableArrayValueForKeyPath:", a3);
}

- (uint64_t)_mutableOrderedSetValueForKeyPath:()NSKeyValueCodingPrivate ofObjectAtIndex:
{
  return objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", a4), "mutableOrderedSetValueForKeyPath:", a3);
}

- (uint64_t)_mutableSetValueForKeyPath:()NSKeyValueCodingPrivate ofObjectAtIndex:
{
  return objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", a4), "mutableSetValueForKeyPath:", a3);
}

- (uint64_t)_setValue:()NSKeyValueCodingPrivate forKeyPath:ofObjectAtIndex:
{
  return objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", a5), "setValue:forKeyPath:", a3, a4);
}

- (uint64_t)_validateValue:()NSKeyValueCodingPrivate forKeyPath:ofObjectAtIndex:error:
{
  return objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", a5), "validateValue:forKeyPath:error:", a3, a4, a6);
}

@end
