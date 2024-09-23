@implementation WFPodcastEpisodeObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFPodcastEpisodeObject;
  objc_msgSendSuper2(&v6, sel_allowedSecureCodingClassesByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("genres"));

  return v3;
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[11];
  _QWORD v4[12];

  v4[11] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("identifier");
  v3[1] = CFSTR("title");
  v4[0] = CFSTR("id");
  v4[1] = CFSTR("attributes.name");
  v3[2] = CFSTR("author");
  v3[3] = CFSTR("descriptionText");
  v4[2] = CFSTR("attributes.artistName");
  v4[3] = &unk_24F93C5E8;
  v3[4] = CFSTR("genres");
  v3[5] = CFSTR("duration");
  v4[4] = CFSTR("attributes.genreNames");
  v4[5] = CFSTR("attributes.durationInMilliseconds");
  v3[6] = CFSTR("episodeNumber");
  v3[7] = CFSTR("releaseDate");
  v4[6] = CFSTR("attributes.episodeNumber");
  v4[7] = CFSTR("attributes.releaseDateTime");
  v3[8] = CFSTR("viewURL");
  v3[9] = CFSTR("feedURL");
  v4[8] = CFSTR("attributes.url");
  v4[9] = CFSTR("attributes.feedUrl");
  v3[10] = CFSTR("artworkURLTemplate");
  v4[10] = CFSTR("attributes.artwork.url");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)descriptionTextJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BEC3A10], "transformerUsingForwardBlock:", &__block_literal_global_41445);
}

+ (id)durationJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BEC4208], "durationJSONTransformer");
}

+ (id)releaseDateJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BEC4210], "releaseDateJSONTransformer");
}

id __56__WFPodcastEpisodeObject_descriptionTextJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("attributes.description.standard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("attributes.description.short"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)author
{
  return self->_author;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (NSArray)genres
{
  return self->_genres;
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (WFTimeInterval)duration
{
  return self->_duration;
}

- (NSURL)viewURL
{
  return self->_viewURL;
}

- (NSURL)feedURL
{
  return self->_feedURL;
}

- (NSString)artworkURLTemplate
{
  return self->_artworkURLTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURLTemplate, 0);
  objc_storeStrong((id *)&self->_feedURL, 0);
  objc_storeStrong((id *)&self->_viewURL, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
